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
    
    
    
    
    //===================
    // -MARK: Init
    //===================
    init(type: WarriorType) {
        super.init()
        switch type {
        case .combatant:
            healthPoints = 100
        case .colossus:
            healthPoints = 180
        case .drawf:
            healthPoints = 25
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
    
}
