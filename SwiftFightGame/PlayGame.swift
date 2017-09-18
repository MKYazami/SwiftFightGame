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
    
    //Allows to store players names in order to check their uniqueness
    private var playersString = [String]()
    
    //Allows to store characters names in order to check their uniqueness
    /**private**/ var charactersString = [String]()
    
    //Allow to dertemine if the context is in error or not
    private var error = Bool()
    
    
    /// Allow to verify if name exists in the array
    ///
    /// - Parameter array: Array of string that contains the names
    /// - Returns: Return a boolean if the name exists or not
    private func nameExists(array: [String]) -> Bool {
        var nameExists = Bool()
        for _ in 0..<array.count {
            for name in array {
                if array.contains(name) {
                    nameExists = true
                } else {
                    nameExists = false
                }
            }
        }
        return nameExists
    }
   
    //Start game
    func startGame() {
        
        //for in loop to make 2 teams
        for teamNumber in 1...2 {
            
            //Instanciation of Player
            let player = Player()
            
            
            //Allows to check that the player's name is unique
            repeat {
                player.namePlayer(teamNumber: teamNumber)
                if !playersString.contains(player.playerName.uppercased()) {
                    error = false
                    playersString.append(player.playerName.uppercased())
                } else {
                    error = true
                    print("🚫 \(player.playerName.uppercased()) already exists. Please choose another one…")
                }
            } while error == true
            
            
            
            //Allow to choose 3 characters
            while player.gameCharacters.count < 3 {
                
                repeat {
                if nameExists(array: charactersString) {
                    error = false
                    player.chooseCharacter(characterNumber: player.gameCharacters.count + 1)
                } else {
                    error = true
                    print("🚫 This name already exists. Please choose another one…")
                }
                } while error == true
                
                //Append the all characters names to charactersString for the 2 instances
                for name in player.charactersNames {
                    
                    charactersString.append(name)
                    
                    //Remove duplicates names
                    charactersString = Array(Set(charactersString))
                }
                //Debug
                print(charactersString)
            }
            //Display the list of characters chosen
            player.listSelectedCharacters()
            
            //Appending in the players array
            players.append(player)
            
            //Debug
            print(charactersString)
        }
        
    }
    
}
