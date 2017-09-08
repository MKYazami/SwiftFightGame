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
    private var playerName = String()
    
    
    //Array which contains the 3 characters chosen
    var charactersTypes = [GameCharacter]()
    
    //Contains the names of the charaters
    var chractersNames = [String]()
    
    //Allow to dertemine if the context is in error or not
    private var error = Bool()
    
    //============
    // MARK: Init
    //============
    
    
    //===============
    // MARK: Methods
    //===============
    
    /**
     Message to ask the player to enter his name
    */
    func namePlayerMessage() {
        print("Enter your name for the team 1/2:")
    }
    
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
     Allow to get the player name and verify if empty or not
     */
    func namePlayer() {
        repeat {
            if let name = readLine() {
                if !name.isEmpty {
                    error = false
                    playerName = name.uppercased()
                    print("Hello \(playerName) 😀")
                } else {
                    error = true
                    print("The player name is empty! Please enter a name.")
                }
            }
            
        } while error == true
    }
    
    /**
     Creat the characters
     */
    private func createCombatant() {
        //Instance of Warrior
        let combatant = Warrior(type: WarriorType.combatant)
        //Append combatant to the array of the characters types
        charactersTypes.append(combatant)
        print("Health points :\(combatant.healthPoints) For debug")
    }
    
    private func createColossus() {
        //Instance of Warrior
        let colossus = Warrior(type: WarriorType.colossus)
        //Append colossus to the array of the characters types
        charactersTypes.append(colossus)
        print("Health points :\(colossus.healthPoints) For debug")
    }
    
    private func createDrawf() {
        //Instance of Warrior
        let drawf = Warrior(type: WarriorType.drawf)
        //Append drawf to the array of the characters types
        charactersTypes.append(drawf)
        print("Health points :\(drawf.healthPoints) For debug")
    }
    
    private func createMagus() {
        //Instance of Healer
        let magus = Healer(type: HealerType.magus)
        //Append magus to the array of the characters types
        charactersTypes.append(magus)
        //Debug
        print("Health points :\(magus.healthPoints) For debug")
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
                    createCombatant()
                case "2":
                    error = false
                    createColossus()
                case "3":
                    error = false
                    createDrawf()
                case "4":
                    error = false
                    createMagus()
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
                        chractersNames.append(name.uppercased())
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
        
        print("\(playerName), you have chosen:")
        
        //This loop allows to get the list from the charactersNames dictionary in order to list the types and names chosen
        for (type, name) in zip (charactersTypes, chractersNames) {
                print("➢ \(type) as \(name)")
            
        }
    }

}

