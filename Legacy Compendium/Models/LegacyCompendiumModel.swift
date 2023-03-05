//
//  LegacyCompendiumDataModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import Foundation

// MARK: - LegacyCompendiumModel
struct LegacyCompendiumModel: Codable, Hashable {
    let collections: Collections

    enum CodingKeys: String, CodingKey {
        case collections = "__collections__"
    }
}

// MARK: - Collections
struct Collections: Codable, Hashable {
    let spellsAndCharms: [SpellsAndCharm]
    let potions: [Potion]?
    let beasts: [Beast]?
    let enemies: [Enemy]?
    let wandHandles: [WandHandle]?
    let brooms: [Broom]?
    let companions: [Companion]?
    let professors: [Enemy]?
    let challenges: Challenges?

    enum CodingKeys: String, CodingKey {
        case spellsAndCharms = "SpellsAndCharms"
        case potions = "Potions"
        case beasts = "Beasts"
        case enemies = "Enemies"
        case wandHandles = "WandHandles"
        case brooms = "Brooms"
        case companions = "Companions"
        case professors = "Professors"
        case challenges = "Challenges"
    }
}

// MARK: - Beast
struct Beast: Codable, Hashable {
    let beastName, description, findIt: String?
    let img: String?

    enum CodingKeys: String, CodingKey {
        case beastName = "beast-name"
        case description = "description"
        case findIt = "find-it"
        case img = "img"
    }
}

// MARK: - Broom
struct Broom: Codable, Hashable {
    let broomName: String?
    let location: String?
    let cost, description: String?
    let img: Img?

    enum CodingKeys: String, CodingKey {
        case broomName = "broom-name"
        case location = "location"
        case cost = "cost"
        case description = "description"
        case img = "img"
    }
}

// MARK: - Img
struct Img: Codable, Hashable {
    let broomLogo, broomImg: String?

    enum CodingKeys: String, CodingKey {
        case broomLogo = "broom-logo"
        case broomImg = "broom-img"
    }
}

//enum Locations: String, Codable {
//    case challenges = "Challenges"
//    case vendor = "Vendor"
//}

// MARK: - Challenges
struct Challenges: Codable, Hashable {
    let combat: Combat?
    let quests: Quests?
    let exploration: Exploration?
    let fieldGuidePages: FieldGuidePages?
    let roomOfRequirement: RoomOfRequirement?

    enum CodingKeys: String, CodingKey {
        case combat = "Combat"
        case quests = "Quests"
        case exploration = "Exploration"
        case fieldGuidePages = "Field Guide Pages"
        case roomOfRequirement = "Room of Requirement"
    }
}

// MARK: - Combat
struct Combat: Codable, Hashable {
    let defeatDarkWizards, defeatDugbogs, defeatGoblins, defeatInferi: [CompleteDuellingFeat]?
    let defeatInfamousFoe, defeatSpiders, defeatTrolls, defeatMongrels: [CompleteDuellingFeat]?
    let completeDuellingFeats: [CompleteDuellingFeat]

    enum CodingKeys: String, CodingKey {
        case defeatDarkWizards = "Defeat Dark Wizards"
        case defeatDugbogs = "Defeat Dugbogs"
        case defeatGoblins = "Defeat Goblins"
        case defeatInferi = "Defeat Inferi"
        case defeatInfamousFoe = "Defeat Infamous Foe"
        case defeatSpiders = "Defeat Spiders"
        case defeatTrolls = "Defeat Trolls"
        case defeatMongrels = "Defeat Mongrels"
        case completeDuellingFeats = "Complete Duelling Feats"
    }
}

// MARK: - CompleteDuellingFeat
struct CompleteDuellingFeat: Codable, Hashable {
    let tiers: Int?
    let requirements, rewards: String?

    enum CodingKeys: String, CodingKey {
        case tiers = "Tiers"
        case requirements = "Requirements"
        case rewards = "Rewards"
    }
}

// MARK: - Exploration
struct Exploration: Codable, Hashable {
    let collectAncientMagicTrees, popBalloons, landingPlatforms, completeMerlinTrials: [CompleteDuellingFeat]?
    let findAstronomyTables, solveHogwartsSecrets: [CompleteDuellingFeat]?

    enum CodingKeys: String, CodingKey {
        case collectAncientMagicTrees = "Collect Ancient Magic Trees"
        case popBalloons = "Pop Balloons"
        case landingPlatforms = "Landing Platforms"
        case completeMerlinTrials = "Complete Merlin Trials"
        case findAstronomyTables = "Find Astronomy Tables"
        case solveHogwartsSecrets = "Solve Hogwarts Secrets"
    }
}

// MARK: - FieldGuidePages
struct FieldGuidePages: Codable, Hashable {
    let collectFieldGuidePagesInHogsmeade, collectFieldGuidePagesInHogwart, collectFieldGuidePagesInTheHighlands: [CompleteDuellingFeat]?

    enum CodingKeys: String, CodingKey {
        case collectFieldGuidePagesInHogsmeade = "Collect Field Guide Pages in Hogsmeade"
        case collectFieldGuidePagesInHogwart = "Collect Field Guide Pages in Hogwart"
        case collectFieldGuidePagesInTheHighlands = "Collect Field Guide Pages in the Highlands"
    }
}

// MARK: - Quests
struct Quests: Codable, Hashable {
    let completeAssignments, completeMainQuests, completeSideRelationshipQuests: [CompleteDuellingFeat]?

    enum CodingKeys: String, CodingKey {
        case completeAssignments = "Complete Assignments"
        case completeMainQuests = "Complete Main Quests"
        case completeSideRelationshipQuests = "Complete Side/Relationship Quests"
    }
}

// MARK: - RoomOfRequirement
struct RoomOfRequirement: Codable, Hashable {
    let breedUniqueBeasts, rescueBeasts, upgradeYourGear: [CompleteDuellingFeat]?

    enum CodingKeys: String, CodingKey {
        case breedUniqueBeasts = "Breed Unique Beasts"
        case rescueBeasts = "Rescue Beasts"
        case upgradeYourGear = "Upgrade Your Gear"
    }
}

// MARK: - Companion
struct Companion: Codable, Hashable {
    let name, house, description, biography: String?
    let magicalAbilitiesAndSkills: MagicalAbilitiesAndSkills?
    let img: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case house = "house"
        case description = "description"
        case biography = "biography"
        case magicalAbilitiesAndSkills = "magical-abilities-and-skills"
        case img = "img"
    }
}

// MARK: - MagicalAbilitiesAndSkills
struct MagicalAbilitiesAndSkills: Codable, Hashable {
    let transfiguration, charms, dueling, wandlessMagic: String?
    let darkArts, charismaAndManipulation, love, parseltongue: String?
    let defenceAgainstTheDarkArts, magicalBeasts: String?

    enum CodingKeys: String, CodingKey {
        case transfiguration, charms, dueling
        case wandlessMagic = "wandless-magic"
        case darkArts = "dark arts"
        case charismaAndManipulation = "charisma and manipulation"
        case love = "love"
        case parseltongue = "parseltongue"
        case defenceAgainstTheDarkArts = "defence against the dark arts"
        case magicalBeasts = "magical-beasts"
    }
}

// MARK: - Enemy
struct Enemy: Codable, Hashable {
    let name, description: String?
    let img: String?
}

// MARK: - Potion
struct Potion: Codable, Hashable {
    let potionName, description, unlock, ingredients: String?
    let img: String?

    enum CodingKeys: String, CodingKey {
        case potionName = "potion-name"
        case description = "description"
        case unlock = "unlock"
        case ingredients = "ingredients"
        case img = "img"
    }
}

// MARK: - SpellsAndCharm
struct SpellsAndCharm: Codable, Hashable {
    let spellName, type, cooldown, unlock: String
    let description, upgrades: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case spellName = "spell-name"
        case type = "type"
        case cooldown = "cooldown"
        case unlock = "unlock"
        case description = "description"
        case upgrades = "upgrades"
        case img = "img"
    }
}

// MARK: - WandHandle
struct WandHandle: Codable, Hashable {
    let handleName, description: String?
    let img: String?

    enum CodingKeys: String, CodingKey {
        case handleName = "handle-name"
        case description = "description"
        case img = "img"
    }
}
