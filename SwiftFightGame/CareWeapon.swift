//
//  WeaponCare.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

class CareWeapon: Weapon {
    var heal: Int
    
    init(type: CareWeaponType) {
        switch type {
        case .antidote:
            heal = 15
        }
    }
}
