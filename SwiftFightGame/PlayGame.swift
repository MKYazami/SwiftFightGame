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
    
    private func selectOwnCharacter(characterToUse: GameCharacter) {
        var characterToUse = characterToUse
        var badChoice = Bool()
        repeat {
            if let character = readLine() {
                if Helper.isNotEmpty(name: character) {
                    switch character {
                    case "1":
                        badChoice = false
                        characterToUse = players[0].gameCharacters[0]
                    case "2":
                        badChoice = false
                        characterToUse = players[0].gameCharacters[1]
                    case "3":
                        badChoice = false
                        characterToUse = players[0].gameCharacters[2]
                    default:
                        badChoice = true
                        print("❌ Incorrect choice! Please choose 1, 2 or 3")
                    }
                }
            }
        } while badChoice == true
    }
    
    private func selectOtherCharacter(characterToFight: GameCharacter) {
        var characterToFight = characterToFight
        var badChoice = Bool()
        repeat {
            if let character = readLine() {
                if Helper.isNotEmpty(name: character) {
                    switch character {
                    case "1":
                        badChoice = false
                        characterToFight = players[1].gameCharacters[0]
                    case "2":
                        badChoice = false
                        characterToFight = players[1].gameCharacters[1]
                    case "3":
                        badChoice = false
                        characterToFight = players[1].gameCharacters[2]
                    default:
                        badChoice = true
                        print("❌ Incorrect choice! Please choose 1, 2 or 3")
                    }
                }
            }
        } while badChoice == true

    }
    
    private func selectCharacterForAction() {
        var characterToUse = GameCharacter(characterName: "", characterType: .combatant)
        var characterToFight = GameCharacter(characterName: "", characterType: .combatant)
        
        print("\(players[0].playerName), select your character to make action: ")
        
        
        for characterIndex in 0..<players[0].gameCharacters.count {
            print("☞ \(characterIndex + 1). \(players[0].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[0].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[0].gameCharacters[characterIndex].healthPoints) ✤")
        }
        
        selectOwnCharacter(characterToUse: characterToUse)
        
        
        
        print("Your adversary is \(players[1].playerName) and has: ")
        
        
        for characterIndex in 0..<players[1].gameCharacters.count {
            print("☞ \(characterIndex + 1). \(players[1].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[1].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[1].gameCharacters[characterIndex].healthPoints) ✤")
        }
        
        
        
        if let warrior = characterToUse as? Warrior {
            print("\(warrior) is Warrior Type")
            warrior.strike(character: characterToFight)
            print("\(characterToFight.characterName) has lost \(warrior.strikeForce) of health points and still has \(characterToFight.healthPoints) health points")
        } else if let healer = characterToUse as? Healer {
            print("\(healer) is Healer Type")
            selectOwnCharacter(characterToUse: characterToUse)
            healer.heal(character: characterToUse)
            print("\(characterToFight.characterName) has got \(healer.careCapacity) of health points and still has \(characterToFight.healthPoints) health points")
        }
        
    }
   
    
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
        print("===============================")
        print("===============================")
        
        selectCharacterForAction()
    }
}
