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
    
    //Contains the names of the charater. For displaying the list of characters
    var charactersNames = [String]()
    
    //Contains the name of character to make check to avoid duplicates
    var name = String()
    
    //Contains the names of the charater. For displaying the list of characters
    private var charactersTypes = [String]()
    
    //Allow to dertemine if the context is in error or not
    private var error = Bool()
    
    //============
    // MARK: Init
    //============
    
    
    //===============
    // MARK: Methods
    //===============
    
    /**
     Allow to get the player name and verify if empty or not with message requiring to enter player name
        - parameters:
            - teamNumber: Allow to know how many teams numbers from the loop => for teamNumber in 1...2 {…}
     */
    func namePlayer(teamNumber: Int) {
        //Message to ask the player to enter his name
        print("Enter your name for the team \(teamNumber)/2:")
        
        repeat {
            if let name = readLine() {
                if !name.isEmpty {
                    error = false
                    playerName = name.uppercased()
                } else {
                    error = true
                    print("🚫 The player name is empty! Please enter a name.")
                }
            }
            
        } while error == true
    }
    
    /**
     Append gameCharacter array
        - Parameters:
            - character: character to append
     */
    private func appendGameCharacters(character: GameCharacter) {
        gameCharacters.append(character)
    }
    
    /**
     Creat the characters
        - parameters: 
            - characterType: String value to know what type of character to initialise
     */
    private func createCharacter(characterType: String) {
        
        switch characterType {
        case "combatant":
            let character = Warrior(type: WarriorType.combatant, name: nameCharacter())
            appendGameCharacters(character: character)
            charactersTypes.append(character.getCharacterTypeString(type: .combatant))
            charactersNames.append(character.getCharacterNameString())
        case "colossus":
            let character = Warrior(type: WarriorType.colossus, name: nameCharacter())
            appendGameCharacters(character: character)
            charactersTypes.append(character.getCharacterTypeString(type: .colossus))
            charactersNames.append(character.getCharacterNameString())
        case "drawf":
            let character = Warrior(type: WarriorType.drawf, name: nameCharacter())
            appendGameCharacters(character: character)
            charactersTypes.append(character.getCharacterTypeString(type: .drawf))
            charactersNames.append(character.getCharacterNameString())
        case "magus":
            let character = Healer(type: HealerType.magus, name: nameCharacter())
            appendGameCharacters(character: character)
            charactersTypes.append(character.getCharacterTypeString(type: .magus))
            charactersNames.append(character.getCharacterNameString())
        default:
            break
        }
        
        
        
        //Debug
//        print("## Health points :\(character.healthPoints) For debug ##")
    }
    /**
     Function to dertermine the type of character according to what the player entres with message requiring to choose the character type
        - parameters:
            - characterNumber: Allows to know how many characters you have to choose
     */
    func chooseCharacter(characterNumber: Int) {
        
        //Contains message and details to help the player make choices
        print("\(playerName), please choose \(characterNumber)/3 character(s) ()==[::::::>"
            + "\n1. Combatant〔 ℹ️  With classic attack, a good warrior 〕"
            + "\n2. Colossus 〔 ℹ️  Very resistant to attacks, but he doesn't cause considerable domages 〕"
            + "\n3. Drawf    〔 ℹ️  His axe generate a lot of damage, but he doesn't have many health points 〕"
            + "\n4. Magus    〔 ℹ️  He doesn't fight, however he can cure you team members 〕"
        )
        
        repeat {
            
            if let type = readLine() {
                //var perso
                switch type {
                case "1":
                    error = false
                    createCharacter(characterType: "combatant")
                case "2":
                    error = false
                    createCharacter(characterType: "colossus")
                case "3":
                    error = false
                    createCharacter(characterType: "drawf")
                case "4":
                    error = false
                    createCharacter(characterType: "magus")
                default:
                    error = true
                    print("❌ Incorrect choice! Please choose 1, 2, 3 or 4")
                    
                }
            }
            
        } while error == true
        
        
    }

    
    /**
     Function allows to enter the character's name by the player with message requiring to enter character name
    */
    func nameCharacter() -> String {
        //Message indicating that the player must enter the character name
        print("Now name the it 〖❗️ Each charater must have a unique name 〗:")
        var nameUppercased = String()
        repeat {
            
            if let name = readLine() {
                if !name.isEmpty {
                    error = false
                    self.name = name
                    
                    if !charactersNames.contains(name.uppercased()) {
                        error = false
                        nameUppercased = name.uppercased()
                    } else {
                        error = true
                        
                        print("🚫 \(name.uppercased()) already exists! Please choose another one")
                    }
                } else {
                    error = true
                    print("🚫 The character name is empty! Please enter a name")
                }
            }
            
        } while error == true
        
        return nameUppercased
    }
    
    
    
    /**
    This function shows the player's name, characters type and names
    */
    func listSelectedCharacters() {
        
        
        print("✔️ \(playerName), you have chosen:")
        
        //This loop allows to get the list from the charactersNames dictionary in order to list the types and names chosen
        for (type, name) in zip (charactersTypes, charactersNames) {
            
            print("➢ \(type) as \(name)")
            
        }
    }

}

