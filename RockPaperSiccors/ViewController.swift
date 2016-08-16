//
//  ViewController.swift
//  RockPaperSiccors
//
//  Created by Patrick Cooke on 8/16/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var yourPickImage: UIImageView!
    @IBOutlet weak var phonePickImage: UIImageView!
    
    let pVSc = PlayerVSCompy()
    
    //MARK: - Action Methods
    
    @IBAction func reset(sender: UIButton) {
        resetAll()
    }
    
    @IBAction func Play(sender: UIButton) {
        resetAll()
        if let playChoice = sender.titleLabel?.text?.lowercaseString {
        pVSc.VScomputer(String(playChoice))
            yourPickImage.image = UIImage(named: playChoice + "black")
        }
        
    }
    
    //MARK: - Reoccuring Methods
    
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
        resultLabel.text = "Rock, Paper or Scissors?"
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tie), name: "tie", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(player), name: "player", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(phone), name: "phone", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(rockpicked), name: "rock", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(paperpicked), name: "paper", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(scissorspicked), name: "scissors", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

