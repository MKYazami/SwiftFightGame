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
    var weaponAttackType = AttackWeaponType.sword
    
    //
    var strikeForce = Int()
    
    var strikeForceWithWeaponChange = Int()
    
    var weaponAttackName = String()
    
    //===================
    // -MARK: Init
    //===================
    /// Initialize the warriors
    ///
    /// - Parameters:
    ///   - characterType: CharacterType.combatant, CharacterType.colossus, CharacterType.drawf
    ///   - name: String name
    ///   - attakWeaponType: AttackWeaponType.sword, AttackWeaponType.bat, AttackWeaponType.axe
    init(characterType: CharacterType, name: String, attakWeaponType: AttackWeaponType) {
        super.init(characterName: name, characterType: characterType)
        switch characterType {
        case .combatant:
            healthPoints = 10 //CHANGING FOR TEST — Initially 100
        case .colossus:
            healthPoints = 180
        case .drawf:
            healthPoints = 10 //CHANGING FOR TEST - Initially 25
        default:
            break
        }
        
        let initStrikeForce = AttackWeapon(type: attakWeaponType)
        
        switch attakWeaponType {
        case .sword:
            strikeForce = initStrikeForce.damages
            weaponAttackType = .sword
        case .bat:
            strikeForce = initStrikeForce.damages
            weaponAttackType = .bat
        case .axe:
            strikeForce = initStrikeForce.damages
            weaponAttackType = .axe
        }

    }
    
    //===================
    // -MARK: Methodes
    //===================
    func strike(character: GameCharacter) {
        character.healthPoints -= strikeForce
    }
    
    /// Same as strike function, except when there is a change of weapon
    ///
    /// - Parameter character: Character to strike
    func strikeWithWeaponChange(character: GameCharacter) {
        character.healthPoints -= strikeForceWithWeaponChange
    }
    
    /// Allow to change weapon attack from instance
    ///
    /// - Parameter typeOfWeapon: Type of weapon to make change
    func weaponChange(typeOfWeapon: AttackWeaponType) {
        
        let changeStrikeForce = AttackWeapon(type: typeOfWeapon)
        
        switch typeOfWeapon {
        case .sword:
            strikeForceWithWeaponChange = changeStrikeForce.damages
            weaponAttackName = "SWORD"
        case .bat:
            strikeForceWithWeaponChange = changeStrikeForce.damages
            weaponAttackName = "BAT"
        case .axe:
            strikeForceWithWeaponChange = changeStrikeForce.damages
            weaponAttackName = "AXE"
        }
    }
    
    
    /// Return character type in the form of string
    ///
    /// - Returns: string
    func getWeaponAttackString() -> String {
        switch weaponAttackType {
        case .sword:
            return "SWORD"
        case .bat:
            return "BAT"
        case .axe:
            return "AXE"
        }
    }
    
}
