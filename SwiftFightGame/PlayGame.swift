//
//  PlayGame.swift
//  SwiftFightGame
//
//  Created by Mehdi on 06/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/// Play the game
class PlayGame {
    //==================
    // MARK: Properties
    //==================
    
    //Contains 2 players for the game
    var players = [Player]()
    
    
    //==================
    // MARK: Methods
    //==================

    
    /// Display the list of characters and return the game character selected
    ///
    /// - Parameters:
    ///   - player: Playerthe who owns the characters (Team or Adversary)
    ///   - icon: Icon to customize the display at the beginning of the list
    /// - Returns: Character selected
    private func charactersList(player: Player, icon: String) -> GameCharacter {
        
        for characterIndex in 0..<player.gameCharacters.count {
            
            let character = player.gameCharacters[characterIndex]
            
            print("\(icon) \(characterIndex + 1). \(character.characterName): ✤ Type: \(character.characterType) ⎮ Health points: \(character.healthPoints)/\(character.displayMaxHealthPoints()) \(character.warnWeakHealthPoints())⎮ Default weapon: \(Weapon.defaultWeaponTypeToDisplay(character: character)) with \(character.getTypeOfAbility()) \(character.getAmountOfAbility()) ✤ ")
        }
        
        //Character selected from selectCharacter() in Player class
        return player.selectCharacter(from: player)
    }

    
    /// Display the summary after strike action
    ///
    /// - Parameters:
    ///   - characterToUseName: Character striking
    ///   - characterToFightName: Character struck
    ///   - lostHealthPoints: The health points lost during the strike
    ///   - characterToFightHealthPoints: The total of health points remaining after the strike
    private func strikeSummary(characterToUseName: String, characterToFightName: String, lostHealthPoints: Int, characterToFightHealthPoints: Int) {
        print("🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶")
        print("\t \(characterToUseName) stroke \(characterToFightName) 👊  \n \t \(characterToFightName) has lost -\(lostHealthPoints) of health points and still has \(characterToFightHealthPoints) health points")
        print("🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶")
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
    
    
    /// Allows to show if the healer has cured him self by the display of "healerName has healed him self"
    ///
    /// - Parameters:
    ///   - characterToHeal: character to heal
    ///   - characterToUse: character to use for healing
    /// - Returns: him self or characterToheal name, depanding of the situation
    private func summaryOfHealing(characterToHeal: GameCharacter, characterToUse: GameCharacter) -> String {
        if characterToHeal.characterName.uppercased() == characterToUse.characterName.uppercased() {
            return "him self"
        } else {
            return "\(characterToHeal.characterName)"
        }
    }
    
    
    /// Check if character stroke is dead, and if is dead it will be removed from the array gameCharacter
    ///
    /// - Parameters:
    ///   - character: Character to check
    ///   - player: Player who will be get the character deleted
    private func deadCharacterNotification(character: GameCharacter, player: Player) {
        if character.isDead() {
            //Dead character notification
            print()
            print("\t ☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️")
            print("\t \t \t \t \t \(character.characterName) is dead 💀💀💀")
            print("\t ☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️")
            print()
            
            //Get the index of character to remove from gameCharacters array
            let indexToRemove = player.gameCharacters.index(where: {$0 === character})!
            
            //Remove from gameCharacters array
            player.gameCharacters.remove(at: indexToRemove)
        }
    }
    
    
    /// Check if player has lost the game and remove it from players array
    ///
    /// - Parameters:
    ///   - looser: The attacked player
    ///   - winner: The attacking player
    ///   - turnCounter: Allows to count the game turns
    private func defeatedPlayerNotification(looser: Player, winner: Player, turnCounter: Int) {
        //Check if player has lost the game and remove it from players array
        if looser.gameCharacters.count <= 0 {
            
            //Game over message
            print()
            print("\t ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
            print("\t❅                GAME OVER                 ❅")
            print("\t ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
            
            
            
            //Winner message
            print()
            print("\t 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊")
            print("\t \t \t The winner is \(winner.playerName) 😄🥇🤗")
            print("\t 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊")
            print()
            
            //Number of game turns 
            print()
            print("\t 🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡")
            print("\t \t \t \t In \(turnCounter) game turns")
            print("\t 🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡🎡")
            print()
            
            //Looser message
            print()
            print("\t 🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀")
            print("\t \t \t \(looser.playerName) has lost the game 😭😭😭")
            print("\t 🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀")
            print()
            
            //Get the index of player to remove from players array
            let indexToRemove = players.index(where: {$0 === looser})
            
            //Removing the looser from players array
            players.remove(at: indexToRemove!)
        }
    }

    
    /// Start the fight phase
    private func fightPhase() {
        //Characters for the actions
        var characterToUse = GameCharacter()
        var characterToFight = GameCharacter()
        var characterToHeal = GameCharacter()
        
        //Turn couter
        var turnCounter = Int()
        
        
        //The player index to iterate players array
        var playerIndex = Int()
        
        while players.count > 1 { //Repeat while there is 2 players in players array
            
                    //******    Icon List Setting    ******//
            //Icon to insert in argument of characterList() for team
            let teamIcon = "👤 ☞"
            //Icon to insert in argument of characterList() for adversary
            let adversaryIcon = "🆚 ☞"
            
            
            //Increment turnCounter for each game turn
            turnCounter += 1
            
            //Team let for better readability
            let team = players[playerIndex]
            
            //Adversary let for better readability
            let adversary = players[adversaryIndex(index: playerIndex)]
            
            
            //Contains true if all team's character are at maximum of health points
            var allCharacterAtMaxHealthPoints = Bool()
            
            repeat {
                //False to avoid to repeat the same loop
                allCharacterAtMaxHealthPoints = false
                
                //Check if all characters are healer type AND if they have reached the maximum health points
                if Helper.CheckIfAllTeamCharactersAtMaxHealthPoints(player: team) && Helper.checkIfAllCharactersAreHealers(player: team) {
                    
                    //Removing all characters from gameCharacters array
                    team.gameCharacters.removeAll()
                    
                    //Message that the player has lost because there is no more action to do
                    print()
                    print("💤💤 \(team.playerName) you lost! \n\tYour characters are all healers and their health points are at maximum allowed. They have no more action to do 💤💤")
                    print()
                    
                    //Complete the game
                    defeatedPlayerNotification(looser: team, winner: adversary, turnCounter: turnCounter)
                    
                    //Exit fightPhase() method
                    break
                }
                
                //Adversary List for the team information only
                print()
                print("⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃")
                print("Your adversary is \(adversary.playerName) and has ℹ️: ")
                
                for characterIndex in 0..<adversary.gameCharacters.count {
                    
                    let character = adversary.gameCharacters[characterIndex]
                    print("ℹ️ \(character.characterName): ✤ Type: \(character.characterType) ⎮ Health points: \(character.healthPoints)/\(character.displayMaxHealthPoints()) \(character.warnWeakHealthPoints())⎮ Default weapon: \(Weapon.defaultWeaponTypeToDisplay(character: character)) with \(character.getTypeOfAbility()) \(character.getAmountOfAbility()) ✤")
                }
                
                
                print("⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃")
                print()
                
                
                //Selection of team characters for action
                print("\(team.playerName), select your character to make action 👇: ")
                
                //Select character to use for action
                characterToUse = charactersList(player: team, icon: teamIcon)
                
                
                
                //Actions and summary of actions, depending if striking or healing
                
                //If character to use is warrior type
                if let warrior = characterToUse as? Warrior {
                    

                    //Open chest notification if open chest conditions are true (The open chest action is under control in Warrior class)
                    warrior.openChestNofication()
                
                    //Super strike notification if open chest condions are true (The super strike action is under control in Warrior class)
                    warrior.superStrikeForceNotification()
                    
                    //Adversary selection to strike
                    repeat {
                        print("Now select a adversary’s character to strike 🗡: ")
                        
                        //Select character to use for action
                        characterToFight = charactersList(player: adversary, icon: adversaryIcon)
                        
                        //Strike
                        warrior.strike(character: characterToFight)
                        
                        //Display summary, only if a characterToMakeAction is selected. Allow to avoid an empty summary
                        if Helper.characterSelectionExists(character: characterToFight) {
                            
                            //Summary of strike
                            strikeSummary(characterToUseName: characterToUse.characterName, characterToFightName: characterToFight.characterName, lostHealthPoints: warrior.getLostHealthPointsValue(), characterToFightHealthPoints: characterToFight.healthPoints)
                            
                            //Check if character stroke is dead, and if is dead it will be removed from the array gameCharacter
                            deadCharacterNotification(character: characterToFight, player: adversary)
                            
                            //Check if player has lost the game and remove from players array
                            defeatedPlayerNotification(looser: adversary, winner: team, turnCounter: turnCounter)
                            
                        }
                        
                    } while !Helper.characterSelectionExists(character: characterToFight)//Will repeat while the adversary character is not selected to strike
                    
                //If character to use is healer type
                } else if let healer = characterToUse as? Healer {
                    
                    //Check if all characters haven't reached the maximum health points to propose another action
                    if  !Helper.CheckIfAllTeamCharactersAtMaxHealthPoints(player: team) {
                        
                        //Bool that define if a character is at the maximum of health points
                        var characterWithMaxHealthPoints = Bool()
                        
                        repeat {
                            characterWithMaxHealthPoints = false
                            print("Now select a team’s character to heal 💊:")
                            
                            //Select character to heal
                            characterToHeal = charactersList(player: team, icon: teamIcon)
                            
                            //Check if characterToHeal contains a character
                            if Helper.characterSelectionExists(character: characterToHeal) {
                                
                                //Check if the character selected to heal is not at the maximum of health points
                                if Helper.checkIfCharacterIsMaxHealthPoints(character: characterToHeal) {
                                    
                                    //Calculated health points that will be given by the healer to display (before to be healed, to get the correct value)
                                    let heathPointsAdded = characterToHeal.getHealthPointsAddedForHealingSummary(healer: healer)
                                    
                                    //Heal
                                    healer.heal(character: characterToHeal)
                                
                                    //Summary of healing
                                    print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
                                    print("\t \(characterToUse.characterName) has healed \(summaryOfHealing(characterToHeal: characterToHeal, characterToUse: characterToUse)) 💊 \n \t \(characterToHeal.characterName) got +\(heathPointsAdded) of health points and now has \(characterToHeal.healthPoints) health points")
                                    print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
                                    
                                } else { //Case if character to heal is at the maximum of health points
                                    print()
                                    print("⚠️ \(characterToHeal.characterName) has reached the maximum of health points, please choose another character to heal")
                                    print()
                                    
                                    //True allows to repeat the loop
                                    characterWithMaxHealthPoints = true
                                }
                            }
                            
                        } while !Helper.characterSelectionExists(character: characterToHeal) || characterWithMaxHealthPoints == true //Will repeat while the team character is not selected to heal OR the character selected is at the maximum of health points
                        
                    } else { //Case if all characters to heal are at the maximum of health points
                        print()
                        print("⚠️ All of your characters have reached the maximum of health points, please choose another action except to heal")
                        print()
                        
                        //True allows to choose another action
                        allCharacterAtMaxHealthPoints = true
                    }
                }
                
            } while !Helper.characterSelectionExists(character: characterToUse) || allCharacterAtMaxHealthPoints == true //Will repeat while the team character is not selected to make action OR all charaters are at max health points
            
            //Condition allow to control the player index and not to be found in index out of range
            if playerIndex == 0 {
                playerIndex = 1
                
            } else {
                playerIndex = 0
            }
            
        }
            
    }

   
    
    /// Start game
    func startGame() {
        //Wellcome message
        print("\t \t \t ▂▃▅▇█▓▒░  ⚔️  Welcome to the Swift Fight Game  ⚔️  ░▒▓█▇▅▃▂ \n\n")
        
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        print("❅                SET PLAYERS               ❅")
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        
        
        //for in loop to make 2 players
        for teamNumber in 1...GameSetting.numberOfplayersByGame {
            //Contains true if the name is not unique
            var notUniqueName = Bool()
            
            //Instanciation of Player
            let player = Player()
            
            
            //Allows to check that the player's name is unique
            repeat {
                player.namePlayer(teamNumber: teamNumber)
                notUniqueName = Helper.checkNotUniqueName(name: player.playerName, players: players)
            } while notUniqueName == true
            
            //Append players array
            players.append(player)
            
            
            //Allow to choose 3 characters
            while player.gameCharacters.count < GameSetting.numberOfCharactersByPlayer {

                player.chooseCharacter(characterNumber: player.gameCharacters.count + 1, players: players)
                

            }
            //Display the selected characters
            player.listSelectedCharacters()
        }
        
        //Fight message
        print()
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        print("❅                START FIGHT               ❅")
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        
        //Start fight
        fightPhase()
    }
}
