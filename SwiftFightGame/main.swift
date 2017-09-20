//
//  main.swift
//  SwiftFightGame
//
//  Created by Mehdi on 24/08/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation
//Wellcome and asking player name message
print("\t \t \t ▂▃▅▇█▓▒░  Welcome to the Swift Fight Game  ░▒▓█▇▅▃▂ \n\n")


let game = PlayGame()

game.startGame()

game.selectTeamCharacter()
//Debug
print(game.players)










//var player = Player()
//
//player.namePlayerMessage()
//    
//player.namePlayer()
//
//
//while player.charactersTypes.count < 3 {
//
//    
//    
//    player.chooseCharacterMenu(choiceNumber: player.charactersTypes.count + 1)
//    
//    player.chooseCharacter()
//
//    player.nameCharacterMessage()
//    player.nameCharacter()
//    
//    //Debug
//    print(player.charactersTypes)
//    print(player.chractersNames)
//    
//}
//
//player.listSelectedCharacters()

