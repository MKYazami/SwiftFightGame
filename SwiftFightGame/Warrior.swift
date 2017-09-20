//
//  Warrior.swift
//  SwiftFightGame
//
//  Created by Mehdi on 04/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation
/**
 Super class of all game characters
 */
class Warrior: GameCharacter {
    //===================
    // -MARK: Properties
    //===================
    
    //Contains the type of wepon and therefore the damages
    var weaponAttackType = AttackWeaponType.self
    
    //
    var strikeForce = Int()
    
    //===================
    // -MARK: Init
    //===================
    /// Initialize the warriors
    ///
    /// - Parameters:
    ///   - type: WarriorType.combatant, WarriorType.colossus, WarriorType.drawf
    ///   - name: String name
    ///   - attakWeaponType: AttackWeaponType.sword, AttackWeaponType.bat, AttackWeaponType.axe
    init(type: WarriorType, name: String, attakWeaponType: AttackWeaponType) {
        super.init(characterName: name)
        switch type {
        case .combatant:
            healthPoints = 100
        case .colossus:
            healthPoints = 180
        case .drawf:
            healthPoints = 25
        }
        
        let initStrikeForce = AttackWeapon(type: attakWeaponType)
        
        switch attakWeaponType {
        case .sword:
            strikeForce = initStrikeForce.damages
        case .bat:
            strikeForce = initStrikeForce.damages
        case .axe:
            strikeForce = initStrikeForce.damages
        }

    }
    
    //===================
    // -MARK: Methodes
    //===================    
    
    /// Return the type of warrior in the form of string
    ///
    /// - Parameter type: The warrior Type
    /// - Returns: Return string
    func getCharacterTypeString(type: WarriorType) -> String {
        switch type {
        case .combatant:
            return "COBATANT"
        case .colossus:
            return "COLOSSUS"
        case .drawf:
            return "DRAWF"
        }
    }
    
    
    func strike(character: GameCharacter) -> Int {
        character.healthPoints -= strikeForce
        return character.healthPoints
    }
    
}
