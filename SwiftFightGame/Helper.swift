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
    /// - Parameter name: The string to check
    /// - Returns: Returns true if not empty
    static func isNotEmpty(name: String) -> Bool {
        if !name.isEmpty {
            return true
        }
        
        print("❌ The name is empty! Please enter a name")
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
            return "zero"
        case 1:
            return "𝟏st"
        case 2:
            return "𝟐nd"
        case 3:
            return "𝟑rd"
        default:
            return "❌ Error: Update this function to get ordinal beyond 3!"
        }
    }
    
}
