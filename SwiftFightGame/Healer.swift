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
    
    
    //===================
    // -MARK: Init
    //===================
    init(type: HealerType, name: String) {
        super.init(characterName: name)
        switch type {
        case .magus:
            healthPoints = 80
        }
    }
    
    //===================
    // -MARK: Methodes
    //===================
    
    /// Return the type of healer in the form of string
    ///
    /// - Parameter type: The healer Type
    /// - Returns: Return string
    func getCharacterTypeString(type: HealerType) -> String {
        switch type {
        case .magus:
            return "MAGUS"
        }
    }
    
}


