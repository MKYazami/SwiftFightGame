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
    private let randomNumberForSuperStrike: Int = Helper.randomNumber(fromNumber: 1, toNumber: 10)
    
    //Get random number between 1 & 10 to open the weapon attack chest
    private let randomNumberToOpenChest: Int = Helper.randomNumber(fromNumber: 1, toNumber: 10)
    
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
    
    /// Determine to open the chest in random conditions
    ///
    /// - Returns: True to open chest
    private func randomOpenChest() -> Bool {
        
        //Open chest when random number is generated between 2 and 6 included
        if randomNumberToOpenChest >= 2 && randomNumberToOpenChest <= 6 {
            return true
        } else {
            return false
        }
    }
    
    
    /// Determine if returns strikeForce or strikeForceWithWeaponChange value depending if the chest is open or not
    ///
    /// - Returns: strikeForce or strikeForceWithWeaponChange value
    private func determineStrikeForceType() -> Int {
        
        //Controling if the chest is open that allows to display the correct value of skrike force
        if randomOpenChest() {
            return strikeForceWithWeaponChange
        } else {
            return strikeForce
        }
    }
    
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
            superStrike(characterToStrike: character, typeOfStrikeForce: determineStrikeForceType())
        } else {
            character.healthPoints -= determineStrikeForceType()
        }
        
    }
    
    
    /// Notify when the chest is open with the type of weapon and force strike value
    func openChestNofication() {
        if randomOpenChest() {
            print()
            print("📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦")
            weaponChange(typeOfWeapon: randomWeaponAttackChange())
            print("\t🗃 The attack weapon chest is at your disposal you got: \(weaponAttackName) with strike force of \(strikeForceWithWeaponChange) 🗃")
            print("📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦")
            print()
        } else {
            print("")
        }
    }
    
    
    /// Allow to display the message when condions are true for super strike force
    ///
    /// - Parameter typeOfStrikeForce: The type of strike force
    func superStrikeForceNotification() {
        if isAtthirdOfHealthPoints() && randomSuperStrike() {
            
            print()
            print("\t💪💪💪 You got a SUPER STRIKE FORCE of \(determineStrikeForceType() * 2) 👊👊👊")
            print()
            
        }
    }
    
    /// Allow to give lost health points value depending if in super strike force condion or normal strike force
    ///
    /// - Parameter typeOfForce: The type of strike force
    /// - Returns: 2 * typeOfForce is super strike force is active or 1 * typeOfForce in normal condition
    func getLostHealthPointsValue() -> Int {
        if isAtthirdOfHealthPoints() && randomSuperStrike() {
            return determineStrikeForceType() * 2
        }
        
        return determineStrikeForceType()
    }
    
    
    /// Allows to change weapon attack
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
