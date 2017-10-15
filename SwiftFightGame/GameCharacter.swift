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
                
            case .drawf:
                if healthPoints > GameSetting.drawfMaxHealthPoints {
                    healthPoints = GameSetting.drawfMaxHealthPoints
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
        case .drawf:
            return "DRAWF"
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
    
    /// Display the maximum of health points allowed for each type of character
    ///
    /// - Returns: Health points
    func displayMaxHealthPoints() -> Int {
        switch characterType {
        case .combatant:
            return GameSetting.combatantMaxHealthPoints
        case .colossus:
            return GameSetting.colossusMaxHealthPoints
        case .drawf:
            return GameSetting.drawfMaxHealthPoints
        case .magus:
            return GameSetting.magusMaxHealthPoints
            
        }
    }

}
