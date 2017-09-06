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
    //Temp property to avoid errors warnings
    var damages = Int()
    
    
    //===================
    // -MARK: Init
    //===================
     init(characterType: WarriorType) {
        
        super.init(characterName: "")
        
        
        switch characterType {
        case .combatant:
            healthPoints = 100
        case .colossus:
            healthPoints = 180
        case .drawf:
            healthPoints = 30
        default:
            healthPoints = 0
        }
    }
    
    
    //===================
    // -MARK: Methodes
    //===================
    /**
     Assign 0 to healthPoints and notify the player that the character is dead
        - parameters:
            - characterName: The name of character that is dead
     */
    func strike(who nameCharacter: GameCharacter) {
        
        self.healthPoints -= damages
        
        if nameCharacter.healthPoints <= 0 {
            deadCharacter(characterName: nameCharacter)
        } else {
            
            print("\(characterName) lost \(damages) of health points")
        }
    }
}
