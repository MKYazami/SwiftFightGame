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
    //Contains the type of character chosen by the player
    var warriorType = WarriorType.combatant
    var healerType =  HealerType.magus
    
    //Contains the player's name
    var playerName = String()
    
    //Contains the name of character chosen by the player
    var characterName = String()
    
    //Array which contains the 3 characters chosen
    var characters = [GameCharacter]()
    
    //Contains the names of the charaters
    var chractersNames = [String]()
    
    //Allow to dertemine if the context is in error or not
    var error = Bool()
    
    //============
    // MARK: Init
    //============
    
    /**
    To initialse the class, you need to get the player's name
    */
    
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
                    warriorType = WarriorType.combatant
                case "2":
                    error = false
                    warriorType = WarriorType.colossus
                case "3":
                    error = false
                    warriorType = WarriorType.drawf
                case "4":
                    error = false
                    healerType = HealerType.magus
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
            
            if let name = readLine() {
                if !name.isEmpty {
                    error = false
                    if !chractersNames.contains(name.uppercased()) {
                        characterName = name.uppercased()
                    } else {
                        error = true
                        print("This name already exists! Please choose another one")
                    }
                } else {
                    error = true
                    print("The character name is empty! Please enter a name")
                }
            }
            
        } while error == true
        
    }
    
    /**
    This function shows the player's name, characters type and names
    */
    func listChooseCharacter() {
        
        print("Hello ???, you have chosen:")
        
    }
    
//    var warrior = Warrior(type: warriorType)
    
}

