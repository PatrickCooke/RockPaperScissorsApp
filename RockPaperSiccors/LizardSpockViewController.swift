//
//  LizardSpockViewController.swift
//  RockPaperSiccors
//
//  Created by Patrick Cooke on 8/16/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit

class LizardSpockViewController: UIViewController {

    let gameAI = lizardSpockVSCompy()
    
    @IBOutlet weak var yourPickImage: UIImageView!
    @IBOutlet weak var phonePickImage: UIImageView!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var spockButton: UIButton!
    @IBOutlet weak var lizardButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //MARK: - Interactivity Methods
    
    @IBAction func Play(sender: UIButton) {
        resetAll()
        if let playChoice = sender.titleLabel?.text?.lowercaseString {
            gameAI.VScomputer(String(playChoice))
            yourPickImage.image = UIImage(named: playChoice + "black")
        }
        
    }
    
    @IBAction func resetButton() {
        resetAll()
    }

    //MARK: - Clean Up Methods
    
    func resetAll() {
        resultLabel.text = ""
        phonePickImage.backgroundColor = UIColor.clearColor()
        yourPickImage.backgroundColor = UIColor.clearColor()
        phonePickImage.image = nil
        yourPickImage.image = nil
    }
    
    func rockpicked() {
        phonePickImage.image = UIImage(named: "rockblack")
    }
    
    func paperpicked() {
        phonePickImage.image = UIImage(named: "paperblack")
    }
    
    func scissorspicked() {
        phonePickImage.image = UIImage(named: "scissorsblack")
    }
    
    func spockpicked() {
        phonePickImage.image = UIImage(named: "spockblack")
    }
    
    func lizardpicked() {
        phonePickImage.image = UIImage(named: "lizardblack")
    }
    
    func tie () {
        resultLabel.text = "It's a Tie"
    }
    
    func player() {
        resultLabel.text = "You Win!"
        yourPickImage.backgroundColor = UIColor.redColor()
    }
    
    func phone() {
        resultLabel.text = "You Lose"
        phonePickImage.backgroundColor = UIColor.redColor()
    }

    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tie), name: "tie", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(player), name: "player", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(phone), name: "phone", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(rockpicked), name: "rock", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(paperpicked), name: "paper", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(scissorspicked), name: "scissors", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(spockpicked), name: "spock", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(lizardpicked), name: "lizard", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
