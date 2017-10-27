//
//  GameConfig.swift
//  SwiftFightGame
//
//  Created by Mehdi on 14/10/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/// Contains some constants or methods that allow to modify the game settings
class GameSetting {
    
    //===============================================================
    // MARK: The maximum of health points for each type of character
    //===============================================================
    
    /// The maximum of health points allowed for combatant (Default value = 100)
    static let combatantMaxHealthPoints: Int = 100
    
    /// The maximum of health points allowed for colossus (Default value = 150)
    static let colossusMaxHealthPoints: Int = 150
    
    /// The maximum of health points allowed for dwarf (Default value = 30)
    static let dwarfMaxHealthPoints: Int = 30
    
    /// The maximum of health points allowed for magus (Default value = 60)
    static let magusMaxHealthPoints: Int = 60
    
    
    //==================================================
    // MARK: The damages for each type of attack weapon
    //==================================================
    
    /// Damages for sword attack weapon type (Default value = 10)
    static var swordDamages: Int = 10
    
    /// Damages for bat attack weapon type (Default value = 4)
    static var batDamages: Int = 4
    
    /// Damages for axe attack weapon type (Default value = 20)
    static var axeDamages: Int = 20
    
    
    //==================================================
    // MARK: The damages for each type of attack weapon
    //==================================================
    
    /// Healing ability for antidote healing weapon type (Default value = 15)
    static var antidoteHealingAbility: Int = 15
    
    
    //======================================
    // MARK: Number of characters by player
    //======================================
    
    /// The number of characters allowed by player (Default value = 3)
    static let numberOfCharactersByPlayer: Int = 3
    
    
    //=================================
    // MARK: Number of players by game
    //=================================
    
    /// The number of players allowed by game (Default value = 2)
    static let numberOfplayersByGame: Int = 2
    
}
