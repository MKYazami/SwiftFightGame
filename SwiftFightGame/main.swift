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


print("Enter your name for the team 1/2:")


var player = Player()


print("The player is \(player.playerName)")
    
while player.charactersNames.count < 3 {
    
    
    
        player.chooseCharacterMenu(choiceNumber: player.charactersNames.count + 1)
        
        player.chooseCharacter()
        
        player.nameCharacterMessage()
        player.nameCharacter()
        
        //Debug        
        print("\(player.charactersNames.count). \(player.charactersNames)")
}

player.listChooseCharacter()

