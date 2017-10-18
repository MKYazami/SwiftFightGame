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
    
    //Allow to get a random number between 1 and 10 to get random super strike
    let randomNumberForSuperStrike: Int = Helper.randomNumber(fromNumber: 1, toNumber: 10)
    
    //===================
    // -MARK: Init
    //===================
    /// Initialize the warriors
    ///
    /// - Parameters:
    ///   - characterType: CharacterType.combatant, CharacterType.colossus, CharacterType.dwarf
    ///   - name: String name
    ///   - attakWeaponType: AttackWeaponType.sword, AttackWeaponType.bat, AttackWeaponType.axe
    init(characterType: CharacterType, name: String, attakWeaponType: AttackWeaponType) {
        super.init(characterName: name, characterType: characterType)
        switch characterType {
        case .combatant:
            healthPoints = GameSetting.combatantMaxHealthPoints
        case .colossus:
            healthPoints = GameSetting.colossusMaxHealthPoints
        case .dwarf:
            healthPoints = GameSetting.dwarfMaxHealthPoints
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
    
    /// Generate a random attack weapon
    ///
    /// - Returns: Attack weapon type
    private func randomWeaponAttackChange() -> AttackWeaponType {
        //Array of weapon type
        var weaponAttack: [AttackWeaponType] = [.sword, .axe, .bat]
        
        //Generate random index
        let randomWeaponAttackIndex: Int = Int(arc4random_uniform(UInt32(weaponAttack.count)))
        
        //Get random weapon attack
        let randomWeaponAttack = weaponAttack[randomWeaponAttackIndex]
        
        
        return randomWeaponAttack
    }
    
    
    /// Determine to open the chest in random conditions
    ///
    /// - Returns: True to open chest
    private func openChest() -> Bool {
        //Get random number between 1 & 10
        let randomNumber = Helper.randomNumber(fromNumber: 1, toNumber: 10)
        
        //Open chest when random number is generated between 2 and 6 included
        if randomNumber >= 2 && randomNumber <= 6 {
            return true
        } else {
            return false
        }
    }
    
    
    /// Allows to get randomly the super strike and all other methods in relation with super strike
    ///
    /// - Returns: True if get super strike
    private func randomSuperStrike() -> Bool {
        
        //Get super strike force when the random number is between 3 and 8 included
        if randomNumberForSuperStrike >= 3 && randomNumberForSuperStrike <= 8 {
            return true
        } else {
            return false
        }
    }
    
    /// Allows to get strike * 2
    ///
    /// - Parameters:
    ///   - characterToStrike: The character to strike
    ///   - typeOfStrikeForce: The type of strike
    private func superStrike(characterToStrike: GameCharacter, typeOfStrikeForce: Int) {
        
        characterToStrike.healthPoints -= typeOfStrikeForce * 2
    }
    
    
    /// Strike a character and remove her health points depending of the force strike of character striking
    ///
    /// - Parameter character: The character to strike
    func strike(character: GameCharacter) {
        
        if isAtthirdOfHealthPoints() && randomSuperStrike() {
            superStrike(characterToStrike: character, typeOfStrikeForce: strikeForce)
        } else {
            character.healthPoints -= strikeForce
        }
        
    }
    
    
    /// Same as strike function, except when there is a change of weapon
    ///
    /// - Parameter character: Character to strike
    func strikeWithWeaponChange(character: GameCharacter) {
        
        if isAtthirdOfHealthPoints() && randomSuperStrike() {
            superStrike(characterToStrike: character, typeOfStrikeForce: strikeForceWithWeaponChange)
        } else {
            character.healthPoints -= strikeForceWithWeaponChange
        }
        
    }
    
    /// Allow to display the message when condions are true for super strike force
    ///
    /// - Parameter typeOfStrikeForce: The type of strike force
    func superStrikeForceMessage(typeOfStrikeForce: Int) {
        if isAtthirdOfHealthPoints() && randomSuperStrike() {
            print()
            print("\t💪💪💪 You got a SUPER STRIKE FORCE of \(typeOfStrikeForce * 2) 👊👊👊")
            print()
        }
    }
    
    /// Allow to give lost health points value depending if in super strike force condion or normal strike force
    ///
    /// - Parameter typeOfForce: The type of strike force
    /// - Returns: 2 * typeOfForce is super strike force is active or 1 * typeOfForce in normal condition
    func getLostHealthPointsValue(typeOfForce: Int) -> Int {
        if isAtthirdOfHealthPoints() && randomSuperStrike() {
            return typeOfForce * 2
        }
        
        return typeOfForce
    }
    
    
    /// Allows to change weapon attack from instance
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
