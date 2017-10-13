//
//  Warrior.swift
//  SwiftFightGame
//
//  Created by Mehdi on 04/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation
/**
 Class of warriors, initialized by enumeration CharacterType
 */
class Warrior: GameCharacter {
    //===================
    // -MARK: Properties
    //===================
    
    var strikeForce = Int()
    
    //Strike force when changing the weapon
    var strikeForceWithWeaponChange = Int()
    
    //Contains the attack weapon in the form of string
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
            healthPoints = GameCharacter.combatantMaxHealthPoints
        case .colossus:
            healthPoints = GameCharacter.colossustMaxHealthPoints
        case .drawf:
            healthPoints = GameCharacter.drawfMaxHealthPoints
        default:
            break
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
    
    
}
