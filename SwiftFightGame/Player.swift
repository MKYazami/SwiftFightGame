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
    var playerName = String()
    
    //Dictionary that contains Type : Names characters
    var charactersNames = [String: String]()
    
    //Teams
    var team = [GameCharacter]()
    
    
    
    //Type's character chose by user
    private var typeInput =  String()
    
    //Name's character chose by user
    private var nameInput = String()
    
    //Allows to control the loops for any invalids entries
    private var error = Bool()
    
    //Contains keys from charactersNames
    private var getKeys = [String]()
    
    //============
    // MARK: Init
    //============
    
    /**
    To initialse the class, you need to get the player's name
    */
    init() {
        repeat {
            if let name = readLine() {
                if !name.isEmpty {
                    error = false
                    playerName = name.uppercased()
                } else {
                    error = true
                    print("The player name is empty! Please enter a name.")
                }
            }
            
        } while error == true
    }
    
    //===============
    // MARK: Methods
    //===============
    
    /**
     Contains message and details to help the player make choices
        - parameters:
            - choiceNumber: variable from loop, allows to know how many characters are chosen
    */
    func chooseCharacterMenu(choiceNumber: Int) {
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
    */
    func chooseCharacter() {
        repeat {
            
            if let type = readLine() {
                //var perso
                switch type {
                case "1":
                    error = false
                    typeInput = "Combatant"
                case "2":
                    error = false
                    typeInput = "Colossus"
                case "3":
                    error = false
                    typeInput = "Drawf"
                case "4":
                    error = false
                    typeInput = "Magus"
                default:
                    error = true
                    print("Incorrect choice! Please choose 1, 2, 3 or 4")
                
                }
            } 

        } while error == true
        
        
    }
    
    
    /**
    Function allows to enter the character's name by the player
    */
    func nameCharacter() {
        repeat {
            if var name = readLine() {
                if !name.isEmpty {
                    error = false
                    //Upper casing now to verify the name in the same conditions' case
                    name = name.uppercased()
                    if !getKeys.contains(name) {
                        error = false
                        nameInput = name
                    } else {
                        error = true
                        print("This name already exists! Please choose another one")
                    }
                } else {
                    error = true
                    print("The name is empty, please enter a valid name!")
                }
            } 
        } while error == true
        
        charactersNames [nameInput] = typeInput
        
        //Puting all keys of the dictionary in getKeys array
        for keys in charactersNames.keys {
            getKeys.append(keys)
        }
        //Removing the duplicates characters' names
        getKeys = (Array(Set(getKeys)))
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
