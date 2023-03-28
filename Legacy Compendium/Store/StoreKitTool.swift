//
//  StoreKitTool.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 16-03-23.
//

import Foundation
import StoreKit

typealias PurchaseResult = Product.PurchaseResult
typealias TransactionListener = Task<Void, Error>

enum PurchaseError: Error {
    case failedVerification
}

enum PurchaseAction {
    case successful
}

class StoreKitTool: ObservableObject {
    @Published var products: [Product] = []
    @Published var purchasedIDs: [String] = []
    @Published private(set) var action: PurchaseAction?
    private var transactionListener: TransactionListener?
    
    init() {
        transactionListener = configureTransactionListener()
    }
    
    deinit {
        transactionListener?.cancel()
    }
    
    @MainActor
    func fetchProducts() async {
        do {
            let products = try await Product.products(for: ["LegacyCompendiumFullApp"])
            self.products = products
            
            await checkIfAlreadyPurchased()
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func checkIfAlreadyPurchased() async  {
        guard let product = products.first else { return }
        
        guard let state = await product.currentEntitlement else { return }
        
        switch state {
        case .unverified(_, _):
            break
        case .verified(let transaction):
            self.purchasedIDs.append(transaction.productID)
            break
        }
    }
    
    @MainActor
    func purchase() async throws {
        guard let product = products.first else { return }
        
        do {
            let result = try await product.purchase()
            
            try await handlePurchase(from: result)
        } catch {
            print(error)
        }
    }
    
    func configureTransactionListener() -> TransactionListener {
        Task.detached(priority: .background) { @MainActor [weak self] in
            do {
                for await result in Transaction.updates {
                    let transaction = try self?.checkVerified(result)
                    self?.action = .successful
                    await transaction?.finish()
                }
            } catch {
                print(error)
            }
        }
    }
    
    @MainActor
    func handlePurchase(from result: PurchaseResult) async throws {
        switch result {
        case .success(let verification):
            let transaction = try checkVerified(verification)
            action = .successful
            await transaction.finish()
        case .userCancelled:
            print("The user has been cancelled")
            break
        case .pending:
            print("Pending...")
            break
        @unknown default:
            break
        }
    }
    
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            print("Purchase error")
            throw PurchaseError.failedVerification
        case .verified(let safe):
            return safe
        }
    }
}
