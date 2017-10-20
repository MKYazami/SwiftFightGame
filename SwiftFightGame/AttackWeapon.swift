//
//  WeaponAttack.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/// Attack weapon initialized by enumeration AttackWeaponType
class AttackWeapon: Weapon {
    
    //==================
    // MARK: Properties
    //==================
    
    var damages: Int
    
    //==================
    // MARK: Init
    //==================
    
    init(type: AttackWeaponType) {
        switch type {
        case .sword:
            damages = GameSetting.swordDamages
        case .bat:
            damages = GameSetting.batDamages
        case .axe:
            damages = GameSetting.axeDamages
        }
    }
    
    //==================
    // MARK: Methods
    //==================
    
    /// Generate a random attack weapon
    ///
    /// - Returns: Attack weapon type
    static func randomAttackWeaponChange() -> AttackWeaponType {
        //Array of weapon type
        var weaponAttack: [AttackWeaponType] = [.sword, .axe, .bat]
        
        //Generate random index
        let randomWeaponAttackIndex: Int = Int(arc4random_uniform(UInt32(weaponAttack.count)))
        
        //Get random weapon attack
        let randomWeaponAttack = weaponAttack[randomWeaponAttackIndex]
        
        
        return randomWeaponAttack
    }
}
