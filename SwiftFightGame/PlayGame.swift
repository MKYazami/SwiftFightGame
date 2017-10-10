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
    
    /// List the team characters
    ///
    /// - Returns: team character selected for action
    private func teamCharacters(player: Player) -> GameCharacter {
        
        for characterIndex in 0..<player.gameCharacters.count {
            print("👤 ☞ \(characterIndex + 1). \(player.gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(player.gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(player.gameCharacters[characterIndex].healthPoints) ⎮ \(getTypeOfAbility(character: player.gameCharacters[characterIndex])) \(getAmountOfAbility(character: player.gameCharacters[characterIndex])) ✤ ")
        }
        
        return player.selectCharacter(from: player)
    }
    
    
    /// List the adversary characters
    ///
    /// - Returns: adversary character to fight
    private func adversaryCharacters(player: Player) -> GameCharacter {
        for characterIndex in 0..<player.gameCharacters.count {
            print("🆚 ☞ \(characterIndex + 1). \(player.gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(player.gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(player.gameCharacters[characterIndex].healthPoints) ⎮ \(getTypeOfAbility(character: player.gameCharacters[characterIndex])) \(getAmountOfAbility(character: player.gameCharacters[characterIndex])) ✤")
        }
        
            return player.selectCharacter(from: player)
    }

    
    /// Allow to get an adversary index for 2 players
    ///
    /// - Parameter index: index from the loop for in
    /// - Returns: corrected index to get adversary
    private func adversaryIndex(index: Int) -> Int {
        
        if index == 0 {
            return index + 1
        } else {
            return index - 1
        }
    }
    
    
    /// Generate a random attack wepon
    ///
    /// - Returns: Attack weapon type
    private func weaponAttackChange() -> AttackWeaponType {
        var weaponAttack: [AttackWeaponType] = [.sword, .axe, .bat]
        
        let randomWeaponAttackIndex: Int = Int(arc4random_uniform(UInt32(weaponAttack.count)))
        
        
        let randomWeaponAttack = weaponAttack[randomWeaponAttackIndex]
        
        
        return randomWeaponAttack
    }
    
    /// Generate a random number between 0 and 10
    ///
    /// - Returns: Random number
    private func randomNumberToOpenChest() -> Int {
        let randomNumber = Int(arc4random_uniform(UInt32(10)))
        
        return randomNumber
    }
    
    
    /// Determine to open the chest in random conditions
    ///
    /// - Returns: True to open chest
    private func openChest() -> Bool {
        if randomNumberToOpenChest() >= 2 && randomNumberToOpenChest() <= 6 {
            return true
        } else {
            return false
        }
    }
    
    /// Check if character stroke is dead, and if is dead it will be removed from the array gameCharacter
    ///
    /// - Parameters:
    ///   - character: Character to check
    ///   - player: Player who will be get the character deleted
    private func deadCharacter(character: GameCharacter, player: Player) {
        if character.isDead() {
            print()
            print("\t ☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️")
            print("\t \t \t \t \t \(character.characterName) is dead 💀💀💀")
            print("\t ☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️")
            print()
            
            let indexToRemove = player.gameCharacters.index(where: {$0 === character})!
            
            player.gameCharacters.remove(at: indexToRemove)
        }
    }
    
    /// //Check if player has lost the game and remove it from players array
    ///
    /// - Parameters:
    ///   - looser: The attacked player
    ///   - winner: The attacking player
    private func defeatedPlayer(looser: Player, winner: Player) {
        //Check if player has lost the game and remove from players array
        if looser.gameCharacters.count <= 0 {
            
            print()
            print("\t 🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀")
            print("\t \t \t \(looser.playerName) has lost the game 😭😭😭")
            print("\t 🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀")
            print()
            
            
            //********* Add stat here for bonus? *********
            print()
            print("\t 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊")
            print("\t \t \t The winner is \(winner.playerName) 😄🥇🤗")
            print("\t 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊")
            print()
            
            
            //Removing the looser from players array
            let indexToRemove = players.index(where: {$0 === looser})
            players.remove(at: indexToRemove!)
        }
    }

    
    /// Start the fight phase
    private func fightPhase() {
        var characterToUse = GameCharacter()
        var characterToFight = GameCharacter()
        var characterToHeal = GameCharacter()
        
        while players.count > 1 { //Repeat while there is 2 players in players array 
            for playerIndex in 0..<players.count {
            
                repeat {
                    //Adversary List presentation
                    print()
                    print("⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃")
                    print("Your adversary is \(players[adversaryIndex(index: playerIndex)].playerName) and has ℹ️: ")
                    
                    for characterIndex in 0..<players[adversaryIndex(index: playerIndex)].gameCharacters.count {
                        print("ℹ️ \(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].healthPoints) ⎮ \(getTypeOfAbility(character: players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex])) \(getAmountOfAbility(character: players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex])) ✤")
                    }
                    
                    print("⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃")
                    print()
                    
                    //Selection of team characters for action
                    print("\(players[playerIndex].playerName), select your character to make action 👇: ")
                    
                    characterToUse = teamCharacters(player: players[playerIndex])
                    
                    
                    
                    //Actions and summary of actions, depending if striking or healing
                    if let warrior = characterToUse as? Warrior {
                        //********** Action to open the chest and get a attack weapon **********
                        
                        //Case of open chest
                        if openChest() {
                            print()
                            print("📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦")
                            warrior.weaponChange(typeOfWeapon: weaponAttackChange())
                            print("\t🗃 The attack weapon chest is at your disposal you got: \(warrior.weaponAttackName) with strike force of \(warrior.strikeForceWithWeaponChange) 🗃")
                            print("📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦📦")
                            print()
                        
                        
                        
                            //Adversary selection to strike
                            repeat {
                                print("Now select a adversary’s character to strike 🗡: ")
                                
                                characterToFight = adversaryCharacters(player: players[adversaryIndex(index: playerIndex)])
                                
                                //Strike
                                warrior.strikeWithWeaponChange(character: characterToFight)
                                
                                //Display summary, only if a characterToMakeAction is selected. Allow to avoid an empty summary
                                if Helper.characterSelectionExists(character: characterToFight) {
                                    
                                    //Summary of action
                                    print("🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶")
                                    print("\t \(characterToUse.characterName) stroke \(characterToFight.characterName) 👊  \n \t \(characterToFight.characterName) has lost -\(warrior.strikeForceWithWeaponChange) of health points and still has \(characterToFight.healthPoints) health points")
                                    print("🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶")
                                    
                                    //Check if character stroke is dead, and if is dead it will be removed from the array gameCharacter
                                    deadCharacter(character: characterToFight, player: players[adversaryIndex(index: playerIndex)])
                                    
                                    //Check if player has lost the game and remove from players array
                                    defeatedPlayer(looser: players[adversaryIndex(index: playerIndex)], winner: players[playerIndex])
                                    
                                }
                                
                            } while !Helper.characterSelectionExists(character: characterToFight)//Will repeat while the adversary character is not selected to strike
                            
                        //Normal case
                        } else {
                            //Adversary selection to strike
                            repeat {
                                print("Now select a adversary’s character to strike 🗡: ")
                                
                                characterToFight = adversaryCharacters(player: players[adversaryIndex(index: playerIndex)])
                                
                                //Strike
                                warrior.strike(character: characterToFight)
                                
                                //Display summary, only if a characterToMakeAction is selected. Allow to avoid an empty summary
                                if Helper.characterSelectionExists(character: characterToFight) {
                                    
                                    //Summary of action
                                    print("🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶")
                                    print("\t \(characterToUse.characterName) stroke \(characterToFight.characterName) 👊  \n \t \(characterToFight.characterName) has lost -\(warrior.strikeForce) of health points and still has \(characterToFight.healthPoints) health points")
                                    print("🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶")
                                    
                                    //Check if character stroke is dead, and if is dead it will be removed from the array gameCharacter
                                    deadCharacter(character: characterToFight, player: players[adversaryIndex(index: playerIndex)])
                                    
                                    //Check if player has lost the game and remove from players array
                                    defeatedPlayer(looser: players[adversaryIndex(index: playerIndex)], winner: players[playerIndex])
                                    
                                }
                                
                            } while !Helper.characterSelectionExists(character: characterToFight)//Will repeat while the adversary character is not selected to strike
                        }
                    } else if let healer = characterToUse as? Healer {
                        
                        //Team selection to heal
                        repeat {
                            print("Now select a team’s character to heal 💊:")
                            
                            characterToHeal = teamCharacters(player: players[playerIndex])
                            
                            //Check if characterToUse contains a character
                            if Helper.characterSelectionExists(character: characterToHeal) {
                                
                                //Heal
                                healer.heal(character: characterToHeal)
                                
                                //Display summary, only if a characterToUse is selected. Allow to avoid an empty summary
                                if Helper.characterSelectionExists(character: characterToHeal) {
                                    
                                    //Summary of action
                                    print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
                                    print("\t \(characterToUse.characterName) has healed \(characterToHeal.characterName) 💊 \n \t \(characterToHeal.characterName) got +\(healer.healingAbility) of health points and now has \(characterToHeal.healthPoints) health points")
                                    print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
                                    
                                }
                            }
                            
                        } while !Helper.characterSelectionExists(character: characterToHeal)//Will repeat while the team character is not selected to heal
                        
                    }
                    
                } while !Helper.characterSelectionExists(character: characterToUse)//Will repeat while the team character is not selected to make action
                
            }
            
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
        print()
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        print("❅                START FIGHT               ❅")
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        
        fightPhase()
    }
}
