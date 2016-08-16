//
//  PlayerVSCompy.swift
//  RockPaperSiccors
//
//  Created by Patrick Cooke on 8/16/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit

class PlayerVSCompy: NSObject {
    static let sharedInstance = PlayerVSCompy()
    
    func VScomputer(playerChoice: String) {
        
        let computerNum = drand48();
        var computerChoice = "NA"
        if (computerNum < 0.34) {
            computerChoice = "rock";
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "rock", object: nil))
        } else if(computerNum <= 0.67) {
            computerChoice = "paper";
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "paper", object: nil))
        } else {
            computerChoice = "scissors";
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "scissors", object: nil))
        }
        print("Computer: " + computerChoice);
        print("Player: " + playerChoice);
        
        defer { compare(playerChoice, computer: computerChoice)
        }
    }
    /*
     func compare(player: String, computer: String) {
     if(player == computer) {
     print("The result is a tie");
     }
     
     else if (player == "rock") {
     if (computer == "scissors") {
     print( "Player wins")
     } else if (computer == "paper") {
     print("iPhone wins")
     }
     }
     
     else if (player == "paper") {
     if (computer == "rock") {
     print("iPhone wins")
     } else {
     print( "Player wins")
     }
     }
     
     else if (player == "scissors") {
     if (computer == "rock") {
     print("iPhone wins")
     } else {
     print("Player wins")
     }
     }
     }
     */
    func compare(player: String, computer: String) {
        if(player == computer) {
            print("It's a Tie")
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "tie", object: nil))
        } else {
            switch player {
            case "rock":
                if (computer == "scissors") {
                    print( "Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else if (computer == "paper") {
                    print("iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            case "paper":
                if (computer == "rock") {
                    print("Player wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "player", object: nil))
                } else {
                    print( "iPhone wins")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "phone", object: nil))
                }
            case "scissors":
                if (computer == "paper") {
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
