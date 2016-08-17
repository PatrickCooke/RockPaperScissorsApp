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
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var tieLabel: UILabel!
    @IBOutlet weak var lossLabel: UILabel!
    
    var winScore = 0
    var tieScore = 0
    var lossScore = 0

    
    let pVSc = PlayerVSCompy()
    
    //MARK: - Action Methods
    
    @IBAction func reset(sender: UIButton) {
        resetAll()
    }
    
    @IBAction func Play(sender: UIButton) {
        resetSome()
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
        winLabel.text = "0"
        tieLabel.text = "0"
        lossLabel.text = "0"
        winScore = 0
        tieScore = 0
        lossScore = 0
    }
    
    func resetSome() {
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
        tieScore += 1
        tieLabel.text = "\(tieScore)"
    }
    
    func player() {
        resultLabel.text = "You Win!"
        yourPickImage.backgroundColor = UIColor.redColor()
        winScore += 1
        winLabel.text = "\(winScore)"
    }
    
    func phone() {
        resultLabel.text = "You Lose"
        phonePickImage.backgroundColor = UIColor.redColor()
        lossScore += 1
        lossLabel.text = "\(lossScore)"
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
        winLabel.text = "0"
        tieLabel.text = "0"
        lossLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

