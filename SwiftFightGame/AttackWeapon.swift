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
    var damages: Int
    
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
}
