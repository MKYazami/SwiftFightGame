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
    
    /// Allow to know if a name is already chosen
    ///
    /// - Parameters:
    ///   - name: The input name
    ///   - players: The array that contains the names chosen
    /// - Returns: Returns true if the the name exists
    static func checkUniqueName(name: String, players: [Player]) -> Bool {
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
    
    
    /// Allow to know if a string is empty or not
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
    
    
    // Allow to know if a selection is did or not
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
    
    
    /// Allow to check if object contains Warrior OR Healer type
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
    
}
