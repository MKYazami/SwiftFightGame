//
//  PlayGame.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

class PlayGame {
    //Contains 2 players for the game
    var players = [Player]()
    
    
   
    
    /// Start game
    func startGame() {
        
        //for in loop to make 2 players
        for teamNumber in 1...2 {
            //Contains true if the name is not unique
            var notUniqueName = Bool()
            
            //Instanciation of Player
            let player = Player()
            
            
            //Allows to check that the player's name is unique
            repeat {
                player.namePlayer(teamNumber: teamNumber)
                notUniqueName = Helper.checkUniqueName(name: player.playerName, players: players)
            } while notUniqueName == true
            
            //Append players array
            players.append(player)
            
            
            //Allow to choose 3 characters
            while player.gameCharacters.count < 3 {

                player.chooseCharacter(characterNumber: player.gameCharacters.count + 1, players: players)
                

            }
            //Display the selected characters
            player.listSelectedCharacters()
        }

    
    }
}
