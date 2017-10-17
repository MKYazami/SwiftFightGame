//
//  Weapon.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/// Super class for other weapon classes, no special thing inside but can serves for a possible evolution
class Weapon {
    
    //==================
    // MARK: Properties
    //==================
    
    var weaponType = AttackWeaponType.self
    
    
    //==================
    // MARK: Methods
    //==================
    
    /// Display the weapon type according to the type of character
    ///
    /// - Parameter character: Character to know what type of weapon
    /// - Returns: Type of weapon in the form of string
    static func defaultWeponTypeToDisplay(character: GameCharacter) -> String {
        switch character.characterType {
        case .combatant:
            return "SWORD"
        case .colossus:
            return "BAT"
        case .dwarf:
            return "AXE"
        case .magus:
            return "ANTIDOTE"
        }
    }
}
