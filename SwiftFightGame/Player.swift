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
    var playerName = String()
    //Dictionary that contains Type : Name characters
    var charactersNames = [String: String]()
    
    //Type's character chose by user
    private var typeInput =  String()
    
    //Name's character chose by user
    private var nameInput = String()
    
    private var errorMessage = String()
    
    /**
    To initialse the class, you need to get the player's name
    */
    init(playerName: String?) {
        if let name = playerName {
            self.playerName = name
        } 
    }
    
    
    /**
     Contains message and details to help the player make choices
        - parameters:
            - choiceNumber: variable from loop for in, allows to know how many characters are chosen
    */
    func chooseCharacterMessage(choiceNumber: Int) {
        print("Please choose \(choiceNumber)/3 character(s) ()==[::::::>"
                + "\n1. Combatant〔 ℹ️  With classic attack, a good warrior 〕"
                + "\n2. Colossus 〔 ℹ️  Very resistant to attacks, but he doesn't cause considerable domages 〕"
                + "\n3. Drawf    〔 ℹ️  His axe generate a lot of damage, but he doesn't have many health points 〕"
                + "\n4. Magus    〔 ℹ️  He doesn't fight, however he can cure you team members 〕"
        )
    }
    
    /**
     Contains message indicating that the player must enter the character name
     */
    func nameCharacterMessage() {
        print("Now name the it 〖❗️ Each charater must have a unique name 〗:")
    }
    
    /**
    Function to dertermine the type of character according to what the player entres
    - parameters:
        - characterType: Get character type from player
    */
    func chooseCharacter(characterType: String?) {
       
        if let type = characterType {
            typeInput = type
            switch typeInput {
            case "1":
                typeInput = "Combatant"
            case "2":
                typeInput = "Colossus"
            case "3":
                typeInput = "Drawf"
            case "4":
                typeInput = "Magus"
            default:
                errorMessage = "I don't uderstand, please make a choice between 1 and 4"
            }
        }
        
        charactersNames [typeInput] = ""
    }
    
    
    /**
    Function allows to enter the character's name by the player
    - parameters:
        - characterName: Get character name from player
    */
    func nameCharacter(characterName: String?) {
        if let name = characterName {
            nameInput = name
        }
        
        charactersNames [typeInput] = nameInput
    }
    
    
    /**
    This function shows the player's name, characters type and names
    */
    func listChooseCharacter() {
        
        print("Hello \(playerName), you have chosen: ")
        
        //This loop allows to get the list from the charactersNames dictionary in order to list the types and names chosen
        for (type, name) in charactersNames {
            print("➢ \(type) as \(name)")
        }
    }
    
}
