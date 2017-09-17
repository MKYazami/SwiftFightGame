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
    

    
    /**
     Assign 0 to healthPoints and notify the player that the character is dead
        - parameters:
            - characterName: The name of character that is dead
    */
}
