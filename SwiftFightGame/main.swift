//
//  main.swift
//  SwiftFightGame
//
//  Created by Mehdi on 24/08/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation
//Wellcome and asking player name message
print("▂▃▅▇█▓▒░  Welcome to the Swift Fight Game  ░▒▓█▇▅▃▂ \n\n"
    + "Enter your name:")

var player = Player(playerName: readLine())

print("The player is \(player.playerName)")

for choiceNumber in 1...3 {
    
    player.chooseCharacterMessage()
    player.chooseCharacter(characterType: readLine())

    player.nameCharacterMessage()
    player.nameCharacter(characterName: readLine())
}


player.resumeChooseCharacter()
