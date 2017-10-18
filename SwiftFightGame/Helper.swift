//
//  Helper.swift
//  SwiftFightGame
//
//  Created by Mehdi on 21/09/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

import Foundation

/// Contains some useful type methodes that allow to make verifications generally in the project
class Helper {
    
    /// Allows to know if a name is already chosen
    ///
    /// - Parameters:
    ///   - name: The input name
    ///   - players: The array that contains the names chosen
    /// - Returns: Returns true if the the name exists
    static func checkNotUniqueName(name: String, players: [Player]) -> Bool {
        for player in players {
            
            //Check name player
            if player.playerName.uppercased() == name.uppercased() {
                print("❌ \(player.playerName.uppercased()) already exists. Please choose another one…")
                return true
            }
            
            //Check name character
            for character in player.gameCharacters {
                if character.characterName.uppercased() == name.uppercased() {
                    print("❌ \(character.characterName.uppercased()) already exists. Please choose another one…")
                    return true
                }
            }
        }
        
        return false
    }
    
    
    /// Allows to know if a string is empty or not
    ///
    /// - Parameters:
    ///   - name: The string to check
    /// - Returns: true if not empty
    static func nameIsNotEmpty(name: String) -> Bool {
        if !name.isEmpty {
            return true
        }
        
        print("❌ The name is empty! Please enter a name…")
        return false
    }
    
    
    // Allows to know if a selection is did or not
    ///
    /// - Parameters:
    ///   - name: character input to check from readLine()
    /// - Returns: true if not empty
    static func characterSelectionIsNotEmpty(name: String) -> Bool {
        if !name.isEmpty {
            return true
        }
        
        print("❌ No character selected! Please select a character…")
        return false
    }
    
    
    /// Allows to check if object contains Warrior OR Healer type
    ///
    /// - Parameter character: object to check
    /// - Returns: true if Warrior OR Healer type exist
    static func characterSelectionExists(character: GameCharacter) ->Bool {
        if character is Warrior || character is Healer {
            return true
        }
        
        return false
    }

    
    /// Add S to character word depending if is singular or plural
    ///
    /// - Parameters:
    ///   - characterNumber: The number of character
    ///   - word: The corerning word
    /// - Returns: returns the word singular or plural
    static func addSToCharacterWordInPlural(characterNumber: Int, word: String) -> String {
        if characterNumber > 1 {
            return word + "s"
        }
        
        return word
    }
    
    
    /// Replace numbers to ordinal
    ///
    /// - Parameter number: number to replace
    /// - Returns: return the ordinal number
    static func replaceNumberToOrdinal(number: Int) -> String {
        switch number {
        
        case 0:
            return "0️⃣"
        case 1:
            return "1️⃣st"
        case 2:
            return "2️⃣nd"
        case 3:
            return "3️⃣rd"
        default:
            return "❌ Error: Update this function to get ordinal beyond 3!"
        }
    }
    
    /// Check if the maximum of health points is at the maximum allowed by character type
    ///
    /// - Parameter character: character to heal
    /// - Returns: False if the character is at the maximum of health points
    static func checkIfCharacterIsMaxHealthPoints(character: GameCharacter) -> Bool {
        
        switch character.characterType {
        case .combatant:
            if character.healthPoints >= GameSetting.combatantMaxHealthPoints {
                return false

            }
            return true
        case .colossus:
            if character.healthPoints >= GameSetting.colossusMaxHealthPoints {
                return false
            }
            return true
        case .dwarf:
            if character.healthPoints >= GameSetting.dwarfMaxHealthPoints {
                return false
            }
            return true
        case .magus:
            if character.healthPoints >= GameSetting.magusMaxHealthPoints {
                return false
            }
            return true
        }
        
    }
    
    /// Check if all charaters are at the maximum of health points
    ///
    /// - Parameter player: Player who possesses the characters
    /// - Returns: True if all characters are at max of health points
    static func CheckIfAllTeamCharactersAtMaxHealthPoints(player: Player) -> Bool {
        //Array with indexes that lets know how many characters are at maximum of health points
        var characterAtMaxHealthPoints = [Int]()
        
        //Iterate the character array
        for character in player.gameCharacters {
            switch character.characterType {
            case .combatant:
                if character.healthPoints >= GameSetting.combatantMaxHealthPoints  {
                    characterAtMaxHealthPoints.append(1)
                }
            case .colossus:
                if character.healthPoints >= GameSetting.colossusMaxHealthPoints  {
                    characterAtMaxHealthPoints.append(2)
                }
            case .dwarf:
                if character.healthPoints >= GameSetting.dwarfMaxHealthPoints  {
                    characterAtMaxHealthPoints.append(3)
                }
            case .magus:
                if character.healthPoints >= GameSetting.magusMaxHealthPoints  {
                    characterAtMaxHealthPoints.append(4)
                }
            }
        }
        
        //Controling if all charaters are at maximum of health points depending of number of character in the gameCharacters array
        switch player.gameCharacters.count {
        case GameSetting.numberOfCharactersByPlayer:
            if characterAtMaxHealthPoints.count >= GameSetting.numberOfCharactersByPlayer {
                return true
            }
            return false
        case GameSetting.numberOfCharactersByPlayer - 1:
            if characterAtMaxHealthPoints.count >= GameSetting.numberOfCharactersByPlayer - 1 {
                return true
            }
            return false
        case GameSetting.numberOfCharactersByPlayer - 2:
            if characterAtMaxHealthPoints.count >= GameSetting.numberOfCharactersByPlayer - 2 {
                return true
            }
            return false
        default:
            return false
        }
        
    }
    
    
    /// Check if all characters are healers type
    ///
    /// - Parameter player: Player who possesses the characters
    /// - Returns: True if all characters are healers
    static func checkIfAllCharactersAreHealers(player: Player) -> Bool {
        
        /// Contains the number of healer
        var numberOfHealers = [Int]()
        
        //Allow to count how much healer in gameCharaters array
        for character in player.gameCharacters {
            if character is Healer {
                numberOfHealers.append(1)
            }
        }
        
        //Controling if all charaters are healers depending of number of character in the gameCharacters array
        switch player.gameCharacters.count {
        case GameSetting.numberOfCharactersByPlayer:
            if numberOfHealers.count >= GameSetting.numberOfCharactersByPlayer {
                return true
            }
            return false
        case GameSetting.numberOfCharactersByPlayer - 1:
            if numberOfHealers.count >= GameSetting.numberOfCharactersByPlayer - 1 {
                return true
            }
            return false
        case GameSetting.numberOfCharactersByPlayer - 2:
            if numberOfHealers.count >= GameSetting.numberOfCharactersByPlayer - 2 {
                return true
            }
            return false
        default:
            return false
        }
    }
    
    
    /// Generate an unsigned random number
    ///
    /// - Parameters:
    ///   - fromNumber: First number included by which, we want to get the random number
    ///   - toNumber: Last number included by which, we want to get the random number
    /// - Returns: Random number
    static func randomNumber(fromNumber: Int, toNumber: Int) -> Int {
        //Get random number between fromNumber & toNumber
        let randomNumber = Int(arc4random_uniform(UInt32(toNumber + 1))) + fromNumber
        
        return randomNumber
    }
    
}
