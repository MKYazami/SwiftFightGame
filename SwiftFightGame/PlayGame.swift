//
//  PlayGame.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

class PlayGame {
    //==================
    // MARK: Properties
    //==================
    
    //Contains 2 players for the game
    var players = [Player]()
    
    
    //==================
    // MARK: Methods
    //==================
    
    
    /// Get amounts of strike force or healing ability depending of type of character
    ///
    /// - Parameter character: game character
    /// - Returns: amounts of strike force or healing ability
    private func getAmountOfAbility(character: GameCharacter) -> Int {
        var amountOfAbility = Int()
        if let warrior = character as? Warrior {
            amountOfAbility = warrior.strikeForce
        } else if let healer = character as? Healer {
            amountOfAbility = healer.healingAbility
        }
        return amountOfAbility
    }
    
    /// Get type of ability as string, depending of type of character
    ///
    /// - Parameter character: game character
    /// - Returns: String "Strike force: " OR "Healing ability: "
    private func getTypeOfAbility(character: GameCharacter) -> String {
        var typeOfAbility = String()
        if character is Warrior {
            typeOfAbility = "Strike force: "
        } else if character is Healer {
            typeOfAbility = "Healing ability: "
        }
        return typeOfAbility
    }
    
    private func teamCharacters() -> GameCharacter {
        
        for characterIndex in 0..<players[0].gameCharacters.count {
            print("👤 ☞ \(characterIndex + 1). \(players[0].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[0].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[0].gameCharacters[characterIndex].healthPoints) ⎮ \(getTypeOfAbility(character: players[0].gameCharacters[characterIndex])) \(getAmountOfAbility(character: players[0].gameCharacters[characterIndex])) ✤ ")
        }
        
        return players[0].selectCharacter(from: players[0])
    }
    
    
    private func adversaryCharacters() -> GameCharacter {
        for characterIndex in 0..<players[1].gameCharacters.count {
            print("🆚 ☞ \(characterIndex + 1). \(players[1].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[1].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[1].gameCharacters[characterIndex].healthPoints) ⎮ \(getTypeOfAbility(character: players[1].gameCharacters[characterIndex])) \(getAmountOfAbility(character: players[1].gameCharacters[characterIndex])) ✤")
        }
        
        return players[1].selectCharacter(from: players[1])
    }
    
    
    private func selectCharacterForAction() {
        var characterToUse = GameCharacter()
        var characterToMakeAction = GameCharacter()
        //Adversary List presentation
        print("Your adversary is \(players[1].playerName) and has ℹ️: ")
        
        
        for characterIndex in 0..<players[1].gameCharacters.count {
            print("ℹ️ \(players[1].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[1].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[1].gameCharacters[characterIndex].healthPoints) ⎮ \(getTypeOfAbility(character: players[1].gameCharacters[characterIndex])) \(getAmountOfAbility(character: players[1].gameCharacters[characterIndex])) ✤")
        }

        
        
        //Selection of team characters for action
        print("\(players[0].playerName), select your character to make action 👇: ")
        
        
        characterToUse = teamCharacters()
        
        
        
        //Summary of actions depending if striking or healing
        if let warrior = characterToUse as? Warrior {
            //Adversary selection to strike
            print("Now select a adversary’s character to strike 🗡: ")
            
            characterToMakeAction = adversaryCharacters()
            
            //Strike
            warrior.strike(character: characterToMakeAction)
            
            //Summary of action
            print("🌶 \(characterToMakeAction.characterName) has lost \(warrior.strikeForce) of health points and still has \(characterToMakeAction.healthPoints) health points")
        } else if let healer = characterToUse as? Healer {
            //Team selection to heal
            print("Now select a team’s character to heal 💊:")
            
            characterToUse = teamCharacters()
            
            healer.heal(character: characterToUse)
            
            //Summary of action
            print("🍀 \(characterToUse.characterName) got \(healer.healingAbility) of health points and now has \(characterToUse.healthPoints) health points")
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
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        print("❅                START FIGHT               ❅")
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        
        selectCharacterForAction()
    }
}
