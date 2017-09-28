//
//  main.swift
//  SwiftFightGame
//
//  Created by Mehdi on 24/08/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation
//Wellcome message
print("\t \t \t ▂▃▅▇█▓▒░  ⚔️  Welcome to the Swift Fight Game  ⚔️  ░▒▓█▇▅▃▂ \n\n")

print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
print("❅                SET PLAYERS               ❅")
print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")

let game = PlayGame()

game.startGame()


//Debug
print(game.players)
