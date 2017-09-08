//
//  PlayGame.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

class PlayGame {
    
    var player = Player()
    
    player.namePlayerMessage()
    
    player.namePlayer()
    
    
    while player.charactersTypes.count < 3 {
    
    
    
    player.chooseCharacterMenu(choiceNumber: player.charactersTypes.count + 1)
    
    player.chooseCharacter()
    
    player.nameCharacterMessage()
    player.nameCharacter()
    
    //Debug
    print(player.charactersTypes)
    print(player.chractersNames)
    
    }
    
    player.listChooseCharacter()
    

}
