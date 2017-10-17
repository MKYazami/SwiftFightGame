//
//  GameCharacter.swift
//  SwiftFightGame
//
//  Created by Mehdi on 04/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/**
 Class to define the differents characters of game
*/
class GameCharacter {
    //===================
    // -MARK: Properties
    //===================
    //Name of character
    var characterName: String
    
    //Character type
    var characterType: CharacterType
    
    //Health points for each character
    var healthPoints = Int() {
        //Setting the maximum of health points a character can get
        didSet {
            switch characterType {
            case .combatant:
                if healthPoints > GameSetting.combatantMaxHealthPoints {
                    healthPoints = GameSetting.combatantMaxHealthPoints
                }
                
            case .colossus:
                if healthPoints > GameSetting.colossusMaxHealthPoints {
                    healthPoints = GameSetting.colossusMaxHealthPoints
                }
                
            case .dwarf:
                if healthPoints > GameSetting.dwarfMaxHealthPoints {
                    healthPoints = GameSetting.dwarfMaxHealthPoints
                }
                
            case .magus:
                if healthPoints > GameSetting.magusMaxHealthPoints {
                    healthPoints = GameSetting.magusMaxHealthPoints
                }
                
            }

        }
    }
    
   
    
    //===================
    // -MARK: Init
    //===================
    init(characterName: String, characterType: CharacterType) {
        self.characterName = characterName
        self.characterType = characterType
    }
    
    //Allow to makes it easy to declare the type in certain cases
    convenience init() {
        
        self.init(characterName: "", characterType: .combatant)
    }
    
    //===================
    // -MARK: Methodes
    //===================
    
    /// Return character name in the form of string
    ///
    /// - Returns: string
    func getCharacterNameString() -> String {
        return characterName
    }
    
    
    /// Return character type in the form of string
    ///
    /// - Returns: string
    func getCharacterTypeString() -> String {
        switch characterType {
        case .combatant:
            return "COMBATANT"
        case .colossus:
            return "COLOSSUS"
        case .dwarf:
            return "dwarf"
        case .magus:
            return "MAGUS"
        }
    }
        
    
    /// Determine if charcter is dead
    ///
    /// - Parameter character: Concerned character
    /// - Returns: true if healthPoints equal or lower than 0 and false if higher than 0
    func isDead() -> Bool {
        if healthPoints <= 0 {
            return true
        } else {
            return false
        }
    }
    
    /// Get amounts of strike force or healing ability depending of character's type
    ///
    /// - Parameter character: game character
    /// - Returns: amounts of strike force or healing ability
    func getAmountOfAbility() -> Int {
        var amountOfAbility = Int()
        if let warrior = self as? Warrior {
            amountOfAbility = warrior.strikeForce
        } else if let healer = self as? Healer {
            amountOfAbility = healer.healingAbility
        }
        return amountOfAbility
    }
    
    /// Display the maximum of health points allowed for each type of character
    ///
    /// - Returns: Health points
    func displayMaxHealthPoints() -> Int {
        switch characterType {
        case .combatant:
            return GameSetting.combatantMaxHealthPoints
        case .colossus:
            return GameSetting.colossusMaxHealthPoints
        case .dwarf:
            return GameSetting.dwarfMaxHealthPoints
        case .magus:
            return GameSetting.magusMaxHealthPoints
            
        }
    }
    
    /// Check if a character is at third or lower of health points
    ///
    /// - Parameter character: Character to check
    /// - Returns: True if at third or bellow of health points
    func isAtthirdOfHealthPoints() -> Bool {
        
        switch characterType {
        case .combatant:
            if healthPoints <= GameSetting.combatantMaxHealthPoints/3 {
                return true
            }
            return false
        case .colossus:
            if healthPoints <= GameSetting.colossusMaxHealthPoints/3 {
                return true
            }
            return false
        case .dwarf:
            if healthPoints <= GameSetting.dwarfMaxHealthPoints/3 {
                return true
            }
            return false
        case .magus:
            if healthPoints <= GameSetting.magusMaxHealthPoints/3 {
                return true
            }
            return false
        }
        
    }
    
}
