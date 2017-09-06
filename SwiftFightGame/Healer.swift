//
//  Healer.swift
//  SwiftFightGame
//
//  Created by Mehdi on 05/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

//
//  Healer.swift
//  SwiftFightGame
//
//  Created by Mehdi on 05/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/**
 Class of warriors, that is depending of WarrioType enumeration
 */
class Healer: GameCharacter {
    //Temp for test and avoid errors warnings
    let care: Int = 0
    
    //===================
    // -MARK: Init
    //===================
    init(healerType: HealerType) {
        
        super.init(characterName: "")
        
        switch healerType {
        case .magus:
            healthPoints = 80
        }
    }
    
    
    func health(characterName: GameCharacter) {
        if characterName.healthPoints > 0 { //Will add the character must be in the same team
            characterName.healthPoints += care
        }
    }
}


