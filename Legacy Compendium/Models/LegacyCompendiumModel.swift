//
//  LegacyCompendiumDataModel.swift
//  Legacy Compendium
//
//  Created by Jacob Aguilar on 21-02-23.
//

import Foundation

// MARK: - PlaylistItemsModel
struct LegacyCompendiumModel: Codable {
    let collections: Collections

    enum CodingKeys: String, CodingKey {
        case collections = "__collections__"
    }
}

// MARK: - Collections
struct Collections: Codable {
    let spellsAndCharms: [String: SpellsAndCharm]
    let potions: Potions
    let beasts: [String: Beast]
    let enemies: [String: Enemy]
    let wandHandles: [String: WandHandle]
    let brooms: [String: Broom]
    let companions: Companions
    let professors: [String: Enemy]
    let challenges: Challenges

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
struct Beast: Codable {
    let beastName, description, findIt: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case beastName = "beast-name"
        case description
        case findIt = "find-it"
        case img
    }
}

// MARK: - Broom
struct Broom: Codable {
    let broomName: String
    let location: Location
    let cost, description: String
    let img: Img

    enum CodingKeys: String, CodingKey {
        case broomName = "broom-name"
        case location, cost, description, img
    }
}

// MARK: - Img
struct Img: Codable {
    let broomLogo, broomImg: String

    enum CodingKeys: String, CodingKey {
        case broomLogo = "broom-logo"
        case broomImg = "broom-img"
    }
}

enum Location: String, Codable {
    case challenges = "Challenges"
    case vendor = "Vendor"
}

// MARK: - Challenges
struct Challenges: Codable {
    let combat: Combat
    let quests: Quests
    let exploration: Exploration
    let fieldGuidePages: FieldGuidePages
    let roomOfRequirement: RoomOfRequirement

    enum CodingKeys: String, CodingKey {
        case combat = "Combat"
        case quests = "Quests"
        case exploration = "Exploration"
        case fieldGuidePages = "Field Guide Pages"
        case roomOfRequirement = "Room of Requirement"
    }
}

// MARK: - Combat
struct Combat: Codable {
    let defeatDarkWizards, defeatDugbogs, defeatGoblins, defeatInferi: [CompleteDuellingFeat]
    let defeatInfamousFoe, defeatSpiders, defeatTrolls, defeatMongrels: [CompleteDuellingFeat]
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
struct CompleteDuellingFeat: Codable {
    let tiers: Int
    let requirements, rewards: String

    enum CodingKeys: String, CodingKey {
        case tiers = "Tiers"
        case requirements = "Requirements"
        case rewards = "Rewards"
    }
}

// MARK: - Exploration
struct Exploration: Codable {
    let collectAncientMagicTrees, popBalloons, landingPlatforms, completeMerlinTrials: [CompleteDuellingFeat]
    let findAstronomyTables, solveHogwartsSecrets: [CompleteDuellingFeat]

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
struct FieldGuidePages: Codable {
    let collectFieldGuidePagesInHogsmeade, collectFieldGuidePagesInHogwart, collectFieldGuidePagesInTheHighlands: [CompleteDuellingFeat]

    enum CodingKeys: String, CodingKey {
        case collectFieldGuidePagesInHogsmeade = "Collect Field Guide Pages in Hogsmeade"
        case collectFieldGuidePagesInHogwart = "Collect Field Guide Pages in Hogwart"
        case collectFieldGuidePagesInTheHighlands = "Collect Field Guide Pages in the Highlands"
    }
}

// MARK: - Quests
struct Quests: Codable {
    let completeAssignments, completeMainQuests, completeSideRelationshipQuests: [CompleteDuellingFeat]

    enum CodingKeys: String, CodingKey {
        case completeAssignments = "Complete Assignments"
        case completeMainQuests = "Complete Main Quests"
        case completeSideRelationshipQuests = "Complete Side/Relationship Quests"
    }
}

// MARK: - RoomOfRequirement
struct RoomOfRequirement: Codable {
    let breedUniqueBeasts, rescueBeasts, upgradeYourGear: [CompleteDuellingFeat]

    enum CodingKeys: String, CodingKey {
        case breedUniqueBeasts = "Breed Unique Beasts"
        case rescueBeasts = "Rescue Beasts"
        case upgradeYourGear = "Upgrade Your Gear"
    }
}

// MARK: - Companions
struct Companions: Codable {
    let natsaiOnai: NatsaiOnai
    let sebastianSallow: SebastianSallow
    let ominisGaunt: OminisGaunt
    let poppySweeting: PoppySweeting

    enum CodingKeys: String, CodingKey {
        case natsaiOnai = "Natsai Onai"
        case sebastianSallow = "Sebastian Sallow"
        case ominisGaunt = "Ominis Gaunt"
        case poppySweeting = "Poppy Sweeting"
    }
}

// MARK: - NatsaiOnai
struct NatsaiOnai: Codable {
    let name, house, description, biography: String
    let magicalAbilitiesAndSkills: NatsaiOnaiMagicalAbilitiesAndSkills
    let img: String

    enum CodingKeys: String, CodingKey {
        case name, house, description, biography
        case magicalAbilitiesAndSkills = "magical-abilities-and-skills"
        case img
    }
}

// MARK: - NatsaiOnaiMagicalAbilitiesAndSkills
struct NatsaiOnaiMagicalAbilitiesAndSkills: Codable {
    let transfiguration, charms, dueling, wandlessMagic: String

    enum CodingKeys: String, CodingKey {
        case transfiguration, charms, dueling
        case wandlessMagic = "wandless-magic"
    }
}

// MARK: - OminisGaunt
struct OminisGaunt: Codable {
    let name, house, description, biography: String
    let magicalAbilitiesAndSkills: OminisGauntMagicalAbilitiesAndSkills
    let img: String

    enum CodingKeys: String, CodingKey {
        case name, house, description, biography
        case magicalAbilitiesAndSkills = "magical-abilities-and-skills"
        case img
    }
}

// MARK: - OminisGauntMagicalAbilitiesAndSkills
struct OminisGauntMagicalAbilitiesAndSkills: Codable {
    let darkArts, parseltongue, defenceAgainstTheDarkArts, love: String

    enum CodingKeys: String, CodingKey {
        case darkArts = "dark arts"
        case parseltongue
        case defenceAgainstTheDarkArts = "defence against the dark arts"
        case love
    }
}

// MARK: - PoppySweeting
struct PoppySweeting: Codable {
    let name, house, description, biography: String
    let magicalAbilitiesAndSkills: PoppySweetingMagicalAbilitiesAndSkills
    let img: String

    enum CodingKeys: String, CodingKey {
        case name, house, description, biography
        case magicalAbilitiesAndSkills = "magical-abilities-and-skills"
        case img
    }
}

// MARK: - PoppySweetingMagicalAbilitiesAndSkills
struct PoppySweetingMagicalAbilitiesAndSkills: Codable {
    let magicalBeasts: String

    enum CodingKeys: String, CodingKey {
        case magicalBeasts = "magical-beasts"
    }
}

// MARK: - SebastianSallow
struct SebastianSallow: Codable {
    let name, house, description, biography: String
    let magicalAbilitiesAndSkills: SebastianSallowMagicalAbilitiesAndSkills
    let img: String

    enum CodingKeys: String, CodingKey {
        case name, house, description, biography
        case magicalAbilitiesAndSkills = "magical-abilities-and-skills"
        case img
    }
}

// MARK: - SebastianSallowMagicalAbilitiesAndSkills
struct SebastianSallowMagicalAbilitiesAndSkills: Codable {
    let darkArts, dueling, charismaAndManipulation, love: String

    enum CodingKeys: String, CodingKey {
        case darkArts = "dark arts"
        case dueling
        case charismaAndManipulation = "charisma and manipulation"
        case love
    }
}

// MARK: - Enemy
struct Enemy: Codable {
    let name, description: String
    let img: String
}

// MARK: - Potions
struct Potions: Codable {
    let wiggenweldPotion, edurus, focusPotion, maximaPotion: Edurus
    let invisibilityPotion, thunderbrewPotion: Edurus

    enum CodingKeys: String, CodingKey {
        case wiggenweldPotion = "wiggenweld-potion"
        case edurus
        case focusPotion = "focus-potion"
        case maximaPotion = "maxima-potion"
        case invisibilityPotion = "invisibility-potion"
        case thunderbrewPotion = "thunderbrew-potion"
    }
}

// MARK: - Edurus
struct Edurus: Codable {
    let potionName, description, unlock, ingredients: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case potionName = "potion-name"
        case description, unlock, ingredients, img
    }
}

// MARK: - SpellsAndCharm
struct SpellsAndCharm: Codable {
    let spellName, type, cooldown, unlock: String
    let description, upgrades: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case spellName = "spell-name"
        case type, cooldown, unlock, description, upgrades, img
    }
}

// MARK: - WandHandle
struct WandHandle: Codable {
    let handleName, description: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case handleName = "handle-name"
        case description, img
    }
}

