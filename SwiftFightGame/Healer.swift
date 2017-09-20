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
    var careCapacity = Int()
    
    //===================
    // -MARK: Init
    //===================
    /// Initialize the healer
    ///
    /// - Parameters:
    ///   - type: HealerType.magus
    ///   - name: String name
    ///   - careWeaponType: CareWeaponType.antidote
    init(type: HealerType, name: String, careWeaponType: CareWeaponType) {
        super.init(characterName: name)
        switch type {
        case .magus:
            healthPoints = 80
        }
        
        let initCareCapacity = CareWeapon(type: careWeaponType)
        
        switch careWeaponType {
        case .antidote:
            careCapacity = initCareCapacity.heal
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
    
 
    func heal(character: GameCharacter) -> Int{
        character.healthPoints += careCapacity
        return character.healthPoints
    }
    
}


