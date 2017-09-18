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
    //Name
    var characterName: String
    
    //Health points for each character
    var healthPoints = Int()
    
    //
    var damages = Int()
    
    
    //===================
    // -MARK: Init
    //===================
    init(characterName: String) {
        self.characterName = characterName
    }
    
    //===================
    // -MARK: Methodes
    //===================
    
    /**
     Return character name in the form of string
     */
    func getCharacterNameString() -> String {
        return characterName
    }
    
    
    /// Determine if charcter is alive
    ///
    /// - Parameter character: Concerned character
    /// - Returns: true if healthPoints higher than 0 and false if equal or lower than 0
    func isAlive(character: GameCharacter) -> Bool {
        var isAlive = Bool()
        if character.healthPoints > 0 {
            isAlive = true
        } else {
            isAlive = false
        }
        
        return isAlive
    }
    
    
    /// Determine if charcter is dead
    ///
    /// - Parameter character: Concerned character
    /// - Returns: true if healthPoints equal or lower than 0 and false if higher than 0
    func isDead(character: GameCharacter) -> Bool {
        var isDead = Bool()
        if character.healthPoints <= 0 {
            isDead = true
        } else {
            isDead = false
        }
        
        return isDead
    }

}
