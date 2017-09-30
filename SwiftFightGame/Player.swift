//
//  Player.swift
//  SwiftFightGame
//
//  Created by Mehdi on 24/08/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

/**
 Player class serves to initialize the player's name, characters' types and characrters' names
*/
class Player {
    //==================
    // MARK: Properties
    //==================
    
    //Contains the player's name
    var playerName = String()
    
    //Array which contains the 3 characters chosen
    var gameCharacters = [GameCharacter]()
    
   
    
    //============
    // MARK: Init
    //============
    
    
    //===============
    // MARK: Methods
    //===============
    
    /**
     Allow to get the player name and verify if empty or not
        - parameters:
            - teamNumber: Allow to know how many teams numbers from the loop => for teamNumber in 1...2 {…}
     */
    func namePlayer(teamNumber: Int) {
        //Contains true if the user input is empty
        var empty = Bool()
        //Message to ask the player to enter his name
        print("↳ Enter your name for the team \(Helper.replaceNumberToOrdinal(number: teamNumber))/2️⃣:")
        
        repeat {
            if let name = readLine() {
                empty = !Helper.nameIsNotEmpty(name: name)
                
                if !empty {
                    playerName = name.uppercased()
                }
            }
            
        } while empty == true
    }
    

    
    /**
     Append gameCharacter array
        - Parameters:
            - character: character to append
     */
    private func appendGameCharacters(character: GameCharacter) {
        gameCharacters.append(character)
    }
    
    
    /// Check if the name is unique and append to gameCharacter array
    ///
    /// - Parameters:
    ///   - name: Input name
    ///   - character: character to append
    ///   - players: The array that contains the players
    private func checkUniqueNameAndAppendGameCharacter(name: String, character: GameCharacter, players: [Player]) {
        //Returns true if name already exists
        let notUniqueName = Helper.checkUniqueName(name: name, players: players)
        
        if !notUniqueName {
            
            appendGameCharacters(character: character)
        }
    }
    
    
    /**
     Create the characters
        - parameters: 
            - characterType: String value to know what type of character to initialise
            - players: The array that contains the players
     */
    private func createCharacter(characterType: String, players: [Player]) {
        
        switch characterType {
        case "combatant":
            let character = Warrior(characterType: CharacterType.combatant, name: nameCharacter(players: players), attakWeaponType: AttackWeaponType.sword)

            checkUniqueNameAndAppendGameCharacter(name: character.characterName, character: character, players: players)
            
        case "colossus":
            let character = Warrior(characterType: CharacterType.colossus, name: nameCharacter(players: players), attakWeaponType: AttackWeaponType.bat)
            
            checkUniqueNameAndAppendGameCharacter(name: character.characterName, character: character, players: players)
            
        case "drawf":
            let character = Warrior(characterType: CharacterType.drawf, name: nameCharacter(players: players), attakWeaponType: AttackWeaponType.axe)

            checkUniqueNameAndAppendGameCharacter(name: character.characterName, character: character, players: players)
            
        case "magus":
            let character = Healer(characterType: CharacterType.magus, name: nameCharacter(players: players), careWeaponType: CareWeaponType.antidote)

            checkUniqueNameAndAppendGameCharacter(name: character.characterName, character: character, players: players)
            
        default:
            break
        }
        
    }
    
    /**
     Function to dertermine the type of character according to what the player entres with message requiring to choose the character type
        - parameters:
            - characterNumber: Allows to know how many characters you have to choose
            - players: The array that contains the names chosen
     */
    func chooseCharacter(characterNumber: Int, players: [Player]) {
        //Contains false if the choice is bad
        var badChoice = Bool()
        
        //Contains message and details to help the player make choices
        print("\(playerName), please choose \(Helper.replaceNumberToOrdinal(number: characterNumber))/3️⃣ character ()==[::::::> ☟"
            + "\n1. Combatant〔 ℹ️  With classic attack, a good warrior 〕"
            + "\n2. Colossus 〔 ℹ️  Very resistant to attacks, but he doesn't cause considerable domages 〕"
            + "\n3. Drawf    〔 ℹ️  His axe generate a lot of damage, but he doesn't have many health points 〕"
            + "\n4. Magus    〔 ℹ️  He doesn't fight, however he can cure you team members 〕"
        )
        
        repeat {
            
            if let type = readLine() {
                
                switch type {
                case "1":
                    badChoice = false
                    createCharacter(characterType: "combatant", players: players)
                case "2":
                    badChoice = false
                    createCharacter(characterType: "colossus", players: players)
                case "3":
                    badChoice = false
                    createCharacter(characterType: "drawf", players: players)
                case "4":
                    badChoice = false
                    createCharacter(characterType: "magus", players: players)
                default:
                    badChoice = true
                    print("❌ Incorrect choice! Please choose 1, 2, 3 or 4")
                    
                }
            }
            
        } while badChoice == true
        
        
    }

    
    /// Function allows to enter the character's name by the player with message requiring to enter character name
    ///
    /// - Parameter players: The array that contains the names chosen
    /// - Returns: return name of characters uppercased
    func nameCharacter(players: [Player]) -> String {
        //Message indicating that the player must enter the character name
        print("↳ Now name it 〖❗️ Each charater must have a unique name ❗️〗:")
        
        //Contains true if the user input is empty
        var empty = Bool()
        
        //Contains true if the name is duplicated
        var duplicatedName = Bool()
        
        //Contains name uppercased
        var nameUppercased = String()
        repeat {
            
            if let name = readLine() {
                
                empty = !Helper.nameIsNotEmpty(name: name)
                
                
                duplicatedName = Helper.checkUniqueName(name: name, players: players)
                if !duplicatedName {
                    nameUppercased = name.uppercased()
                }
                
                    
            }
            
        } while empty == true || duplicatedName == true
        
        return nameUppercased
    }
    
    
    
    /**
    This function shows the player's name, characters type and names
    */
    func listSelectedCharacters() {
        
        
        print("✅ \(playerName), you have chosen:")
        
        //This loop allows to get the list from the gameCharacters array in order to list the types and names chosen
        for index in 0..<gameCharacters.count {
            print("\(index + 1). \(gameCharacters[index].characterName) as ➸ \(gameCharacters[index].getCharacterTypeString())")
        }
        
    }
    
     /// Allow to select character to make action (strike or heal)
     ///
     /// - Parameter player: player who will choose the character
     /// - Returns: GameCharacter
     func selectCharacter(from player: Player) -> GameCharacter {
        var character = GameCharacter()
        var badChoice = Bool()
        repeat {
            if let characterInput = readLine() {
                if Helper.characterSelectionIsNotEmpty(name: characterInput) {
                    switch characterInput {
                    case "1":
                        badChoice = false
                        character = player.gameCharacters[0]
                    case "2":
                        badChoice = false
                        character = player.gameCharacters[1]
                    case "3":
                        badChoice = false
                        character = player.gameCharacters[2]
                    default:
                        badChoice = true
                        print("❌ Incorrect choice! Please choose 1, 2 or 3")
                    }
                }
            }
        } while badChoice == true
        
        return character
    }

}

