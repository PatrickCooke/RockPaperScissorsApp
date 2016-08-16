//
//  lizardSpockVSCompy.swift
//  RockPaperSiccors
//
//  Created by Patrick Cooke on 8/16/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit

class lizardSpockVSCompy: NSObject {
    static let sharedInstance = PlayerVSCompy()
    
    func VScomputer(playerChoice: String) {
        let computerNum = drand48();
        var computerChoice = "NA"
        if (computerNum < 0.20) {
            computerChoice = "rock";
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "rock", object: nil))
        } else if(computerNum < 0.40) {
            computerChoice = "paper"
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "paper", object: nil))
        } else if (computerNum < 0.6){
            computerChoice = "scissors"
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "scissors", object: nil))
        }else if (computerNum < 0.8) {
            computerChoice = "lizard"
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "lizard", object: nil))
        } else {
            computerChoice = "spock"
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "spock", object: nil))
        }
        
        print("Computer: " + computerChoice);
        print("Player: " + playerChoice);
        
        defer { compare(playerChoice, computer: computerChoice)
        }
    }
    
    func compare(player: String, computer: String) {
        if(player == computer) {
            print("It's a Tie")
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "tie", object: nil))
        } else {
            switch player {
            case "rock":
                if (computer == "scissors") || (computer == "lizard") {
                    print( "Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else if (computer == "paper") || (computer == "spock") {
                    print("iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            case "paper":
                if (computer == "rock") || (computer == "spock") {
                    print("Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else if (computer == "scissors") || (computer == "lizard") {
                    print( "iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            case "scissors":
                if (computer == "paper") || (computer == "lizard") {
                    print("Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else {
                    print("iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            case "lizard":
                if (computer == "spock") || (computer == "paper") {
                    print("Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else {
                    print("iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            case "spock":
                if (computer == "") || (computer == "") {
                    print("Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else {
                    print("iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            default:
                print("game is a push")
            }
        }
    }
    
    
    
}
