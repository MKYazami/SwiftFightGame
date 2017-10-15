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
    
    
    /// Get amounts of strike force or healing ability depending of character's type
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
    
    ///Calculation of health points that will be given by the healer to display logically
    ///
    /// - Parameters:
    ///   - character: Character to heal
    ///   - healer: Healer that makes cure
    /// - Returns: Health points given by the healer
    private func getHealthPointsAddedForHealingSummary(character: GameCharacter, healer: Healer) -> Int {
        
        //Cheking the health points given by the healer to get a logical amount for healing summary
        switch character.characterType {
        case .combatant:
            if character.healthPoints > (GameSetting.combatantMaxHealthPoints - healer.healingAbility) {
                return GameSetting.combatantMaxHealthPoints - character.healthPoints
            } else {
                return healer.healingAbility
            }
        case .colossus:
            if character.healthPoints > (GameSetting.colossusMaxHealthPoints - healer.healingAbility) {
                return GameSetting.colossusMaxHealthPoints - character.healthPoints
            } else {
                return healer.healingAbility
            }
        case .drawf:
            if character.healthPoints > (GameSetting.drawfMaxHealthPoints - healer.healingAbility) {
                return GameSetting.drawfMaxHealthPoints - character.healthPoints
            } else {
                return healer.healingAbility
            }
        case .magus:
            if character.healthPoints > (GameSetting.magusMaxHealthPoints - healer.healingAbility) {
                return GameSetting.magusMaxHealthPoints - character.healthPoints
                
            } else {
                return healer.healingAbility
            }
        }
    }
    
    /// Get type of ability as string, depending of character's type
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
    
    /// Display the weapon type according to the type of character
    ///
    /// - Parameter character: Character to know what type of weapon
    /// - Returns: Type of weapon in the form of string
    private func defaultWeponTypeToDisplay(character: GameCharacter) -> String {
        switch character.characterType {
        case .combatant:
            return "SWORD"
        case .colossus:
            return "BAT"
        case .drawf:
            return "AXE"
        case .magus:
            return "ANTIDOTE"
        }
    }
    
    /// List the team characters
    ///
    /// - Returns: team character selected for action
    private func teamCharacters(player: Player) -> GameCharacter {
        
        for characterIndex in 0..<player.gameCharacters.count {
            print("👤 ☞ \(characterIndex + 1). \(player.gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(player.gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(player.gameCharacters[characterIndex].healthPoints)/\(player.gameCharacters[characterIndex].displayMaxHealthPoints()) ⎮ Default weapon: \(defaultWeponTypeToDisplay(character: player.gameCharacters[characterIndex])) with \(getTypeOfAbility(character: player.gameCharacters[characterIndex])) \(getAmountOfAbility(character: player.gameCharacters[characterIndex])) ✤ ")
        }
        
        return player.selectCharacter(from: player)
    }
    
    
    /// List the adversary characters
    ///
    /// - Returns: adversary character to fight
    private func adversaryCharacters(player: Player) -> GameCharacter {
        for characterIndex in 0..<player.gameCharacters.count {
            print("🆚 ☞ \(characterIndex + 1). \(player.gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(player.gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(player.gameCharacters[characterIndex].healthPoints)/\(player.gameCharacters[characterIndex].displayMaxHealthPoints()) ⎮ Default weapon: \(defaultWeponTypeToDisplay(character: player.gameCharacters[characterIndex])) with \(getTypeOfAbility(character: player.gameCharacters[characterIndex])) \(getAmountOfAbility(character: player.gameCharacters[characterIndex])) ✤")
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
    
    
    /// Generate a random attack weapon
    ///
    /// - Returns: Attack weapon type
    private func weaponAttackChange() -> AttackWeaponType {
        //Array of weapon type
        var weaponAttack: [AttackWeaponType] = [.sword, .axe, .bat]
        
        //Generate random index
        let randomWeaponAttackIndex: Int = Int(arc4random_uniform(UInt32(weaponAttack.count)))
        
        //Get random weapon attack
        let randomWeaponAttack = weaponAttack[randomWeaponAttackIndex]
        
        
        return randomWeaponAttack
    }
    
    /// Generate a random number between 1 and 10
    ///
    /// - Returns: Random number
    private func randomNumberToOpenChest() -> Int {
        //Get random number between 1 & 10
        let randomNumber = Int(arc4random_uniform(UInt32(11))) + 1
        
        return randomNumber
    }
    
    
    /// Determine to open the chest in random conditions
    ///
    /// - Returns: True to open chest
    private func openChest() -> Bool {
        //Open chest when random number is generated between 2 and 6 included
        if randomNumberToOpenChest() >= 2 && randomNumberToOpenChest() <= 6 {
            return true
        } else {
            return false
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
    private func deadCharacter(character: GameCharacter, player: Player) {
        if character.isDead() {
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
    private func defeatedPlayer(looser: Player, winner: Player) {
        //Check if player has lost the game and remove from players array
        if looser.gameCharacters.count <= 0 {
            
            //Looser message
            print()
            print("\t 🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀")
            print("\t \t \t \(looser.playerName) has lost the game 😭😭😭")
            print("\t 🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀")
            print()
            
            //Winner message
            print()
            print("\t 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊")
            print("\t \t \t The winner is \(winner.playerName) 😄🥇🤗")
            print("\t 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊")
            print()
            
            
            //Get the index of player to remove from players array
            let indexToRemove = players.index(where: {$0 === looser})
            
            //Removing the looser from players array
            players.remove(at: indexToRemove!)
        }
    }

    
    /// Start the fight phase
    private func fightPhase() {
        var characterToUse = GameCharacter()
        var characterToFight = GameCharacter()
        var characterToHeal = GameCharacter()
    
        //The player index to iterate players array
        var playerIndex = 0
        
        while players.count > 1 { //Repeat while there is 2 players in players array
            
            //Contains true if all team's character are at maximum of health points
            var allCharacterAtMaxHealthPoints = Bool()
            
            repeat {
                //False to avoid to repeat the same loop
                allCharacterAtMaxHealthPoints = false
                
                //Check if all characters are healer type AND if they have reached the maximum health points
                if Helper.CheckIfAllTeamCharactersAtMaxHealthPoints(player: players[playerIndex]) && Helper.checkIfAllCharactersAreHealers(player: players[playerIndex]) {
                    
                    //Removing all characters from gameCharacters array
                    players[playerIndex].gameCharacters.removeAll()
                    
                    //Message that the player has lost
                    print()
                    print("💤💤 \(players[playerIndex].playerName) you lost! \n\tYour characters are all healers and their health points are at maximum allowed. They have no more action to do 💤💤")
                    print()
                    
                    //Complete the game
                    defeatedPlayer(looser: players[playerIndex], winner: players[adversaryIndex(index: playerIndex)])
                    
                    break
                }
                
                //Adversary List for information
                print()
                print("⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃⊂⊃")
                print("Your adversary is \(players[adversaryIndex(index: playerIndex)].playerName) and has ℹ️: ")
                
                for characterIndex in 0..<players[adversaryIndex(index: playerIndex)].gameCharacters.count {
                    print("ℹ️ \(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].getCharacterNameString()): ✤ Type: \(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].getCharacterTypeString()) ⎮ Health points: \(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].healthPoints)/\(players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex].displayMaxHealthPoints()) ⎮ Default weapon: \(defaultWeponTypeToDisplay(character: players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex])) with \(getTypeOfAbility(character: players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex])) \(getAmountOfAbility(character: players[adversaryIndex(index: playerIndex)].gameCharacters[characterIndex])) ✤")
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
                        
                      //Normal case (chest not open)
                    } else {
                        //Adversary selection to strike
                        repeat {
                            print("Now select a adversary’s character to strike 🗡: ")
                            
                            characterToFight = adversaryCharacters(player: players[adversaryIndex(index: playerIndex)])
                            
                            //Strike
                            warrior.strike(character: characterToFight)
                            
                            //Display summary, only if a characterToMakeAction is selected. Allow to avoid an empty summary
                            if Helper.characterSelectionExists(character: characterToFight) {
                                
                                //Summary of strike
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
                    
                    if  !Helper.CheckIfAllTeamCharactersAtMaxHealthPoints(player: players[playerIndex]) {
                        //Team selection to heal
                        
                        //Bool that define if a character is at the maximum of health points
                        var characterWithMaxHealthPoints = Bool()
                        
                        repeat {
                            characterWithMaxHealthPoints = false
                            print("Now select a team’s character to heal 💊:")
                            
                            characterToHeal = teamCharacters(player: players[playerIndex])
                            
                            //Check if characterToHeal contains a character
                            if Helper.characterSelectionExists(character: characterToHeal) {
                                
                                //Check if the character selected to heal is not at the maximum of health points
                                if Helper.checkIfCharacterIsMaxHealthPoints(character: characterToHeal) {
                                    
                                    //Calculated health points that will be given by the healer to display
                                    let heathPointsAdded = getHealthPointsAddedForHealingSummary(character: characterToHeal, healer: healer)
                                    
                                    //Heal
                                    healer.heal(character: characterToHeal)
                                
                                    //Summary of healing
                                    print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
                                    print("\t \(characterToUse.characterName) has healed \(summaryOfHealing(characterToHeal: characterToHeal, characterToUse: characterToUse)) 💊 \n \t \(characterToHeal.characterName) got +\(heathPointsAdded) of health points and now has \(characterToHeal.healthPoints) health points")
                                    print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
                                    
                                } else {
                                    print()
                                    print("⚠️ \(characterToHeal.characterName) has reached the maximum of health points, please choose another character to heal")
                                    characterWithMaxHealthPoints = true
                                    print()
                                }
                            }
                            
                        } while !Helper.characterSelectionExists(character: characterToHeal) || characterWithMaxHealthPoints == true //Will repeat while the team character is not selected to heal OR the character selected is at the maximum of health points
                        
                    } else {
                        print()
                        print("⚠️ All of your characters have reached the maximum of health points, please choose another action except to heal")
                        allCharacterAtMaxHealthPoints = true
                        print()
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
                notUniqueName = Helper.checkUniqueName(name: player.playerName, players: players)
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
        //Start fight message
        print()
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        print("❅                START FIGHT               ❅")
        print(" ❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅❅")
        
        fightPhase()
    }
}
