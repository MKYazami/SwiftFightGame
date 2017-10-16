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
    ///   - characterType: CharacterType.combatant, CharacterType.colossus, CharacterType.drawf
    ///   - name: String name
    ///   - attakWeaponType: AttackWeaponType.sword, AttackWeaponType.bat, AttackWeaponType.axe
    init(characterType: CharacterType, name: String, attakWeaponType: AttackWeaponType) {
        super.init(characterName: name, characterType: characterType)
        switch characterType {
        case .combatant:
            healthPoints = GameSetting.combatantMaxHealthPoints
        case .colossus:
            healthPoints = GameSetting.colossusMaxHealthPoints
        case .drawf:
            healthPoints = GameSetting.drawfMaxHealthPoints
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
        
        if isAtthirdOfHealthPoints(character: self) && randomSuperStrike() {
            superStrike(characterToStrike: character, typeOfStrikeForce: strikeForce)
        } else {
            character.healthPoints -= strikeForce
        }
        
    }
    
    
    /// Same as strike function, except when there is a change of weapon
    ///
    /// - Parameter character: Character to strike
    func strikeWithWeaponChange(character: GameCharacter) {
        
        if isAtthirdOfHealthPoints(character: self) && randomSuperStrike() {
            superStrike(characterToStrike: character, typeOfStrikeForce: strikeForceWithWeaponChange)
        } else {
            character.healthPoints -= strikeForceWithWeaponChange
        }
        
    }
    
    func superStrikeForceMessage(typeOfStrikeForce: Int) {
        if isAtthirdOfHealthPoints(character: self) && randomSuperStrike() {
            print()
            print("\t💪💪💪 You got a SUPER STRIKE FORCE of \(typeOfStrikeForce * 2) 👊👊👊")
            print()
        }
    }
    
    func getLostHealthPointsValue(typeOfForce: Int) -> Int {
        if isAtthirdOfHealthPoints(character: self) && randomSuperStrike() {
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
