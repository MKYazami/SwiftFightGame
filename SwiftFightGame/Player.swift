//
//  Player.swift
//  SwiftFightGame
//
//  Created by Mehdi on 24/08/2017.
//  Copyright © 2017 Medev. All rights reserved.
//

/**
 Player class serves to initialize the player name, characters type and characrters name
*/
class Player {
    var playerName = String()
    var charactersNames = ["combatant": "", "colossus": "", "drawf": "", "magus": ""]
    var typeInput =  String()
    var nameInput = String()
    fileprivate var error = String()
    
    
    init(playerName: String?) {
        if let name = playerName {
            self.playerName = name
        } 
    }
    
    
    /**
     Content message and details to help the player to make the choices
    */
    func chooseCharacterMessage() {
        print("Please choose character ()==[::::::>"
                + "\n1. Combatant〔 ℹ️  With classic attack, a good warrior 〕"
                + "\n2. Colossus 〔 ℹ️  Very resistant to attacks, but he doesn't cause considerable domages 〕"
                + "\n3. Drawf    〔 ℹ️  His axe generate a lot of damage, but he doesn't have many health points 〕"
                + "\n4. Magus    〔 ℹ️  He doesn't fight, however he can cure you team members 〕"
        )
    }
    
    /**
     Content message indicating that the player must enter the character name
    */
    func nameCharacterMessage() {
        print("Now name it 〖❗️ Each charater must have a unique name 〗:")
    }
    
    
    
    /**
     Function to dertermine the type of character according what the player entred
        - parameters:
            - characterType: Get character type from player
    */
    func chooseCharacter(characterType: String?) {
       
        if let type = characterType {
            typeInput = type
            switch typeInput {
            case "1":
                typeInput = "combatant"
            case "2":
                typeInput = "colossus"
            case "3":
                typeInput = "drawf"
            case "4":
                typeInput = "magus"
            default:
                error = "I don't uderstand, please make a choice between 1 and 4"
            }
        }
    }
    
    /**
    Function allows to enter the character's name from the player
     - parameters:
        - characterName: Get character name from player
    */
    func nameCharacter(characterName: String?) {
        if let name = characterName {
            nameInput = name
        }

    }
    
    /**
     Extract the informations from charactersNames dictionary in order to get the list of the characters type and thier names
    */
    func listCharactersNames() -> String {
        var characterName = String()
        for (character, name) in charactersNames {
            characterName = "➢ \(character) as \(name) \n"
        }
        
        return characterName
    }
    
    /**
     This function shows the player's name, characters and there names
    */
    func resumeChooseCharacter() {
        charactersNames = [typeInput : nameInput]
        
        print("Hello \(playerName), you have chosen \(listCharactersNames())")
    }
    
}
