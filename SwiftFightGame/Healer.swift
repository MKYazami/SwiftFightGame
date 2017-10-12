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
 Class of healers, initialized by enumeration CharacterType
 */
class Healer: GameCharacter {
    //===================
    // -MARK: Init
    //===================
    var healingAbility = Int()
    
    //===================
    // -MARK: Init
    //===================
    /// Initialize the healer
    ///
    /// - Parameters:
    ///   - type: CharacterType.magus
    ///   - name: String name
    ///   - careWeaponType: CareWeaponType.antidote
    init(characterType: CharacterType, name: String, careWeaponType: CareWeaponType) {
        super.init(characterName: name, characterType: characterType)
        switch characterType {
        case .magus:
            healthPoints = 10 //CHANGING FOR TEST - Initially 60
        default:
            break
        }
        
        let initCareCapacity = CareWeapon(type: careWeaponType)
        
        switch careWeaponType {
        case .antidote:
            healingAbility = initCareCapacity.heal
        }

    }
    
    //===================
    // -MARK: Methodes
    //===================
    
 
    func heal(character: GameCharacter) {
        character.healthPoints += healingAbility
    }
    
}
