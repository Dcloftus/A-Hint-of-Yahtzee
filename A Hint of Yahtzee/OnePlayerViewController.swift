//
//  OnePlayerViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/25/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
//********************************** MAIN FUNCTIONS **********************************//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Menu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//***********************************************************************************//
    
    
    
    
    
//************************************* Outlets *************************************//
    
    @IBOutlet weak var topLeft: UIImageView!
    
    @IBOutlet weak var topRight: UIImageView!
    
    @IBOutlet weak var bottomLeft: UIImageView!
    
    @IBOutlet weak var bottomCenter: UIImageView!
    
    @IBOutlet weak var bottomRight: UIImageView!
    

    @IBOutlet weak var Roll: UIButton!
    
    
    @IBOutlet weak var TopLeftSwitch: UISwitch!
    
    @IBOutlet weak var TopRightSwitch: UISwitch!
    
    @IBOutlet weak var BottomLeftSwitch: UISwitch!
    
    @IBOutlet weak var BottomCenterSwitch: UISwitch!
    
    @IBOutlet weak var BottomRightSwitch: UISwitch!
    
    
    @IBOutlet weak var CurrentScore: UILabel!
    
    
//***********************************************************************************//
    
    
    
//************************************ Variables ************************************//
    var scores: [UInt32] = [0,0,0,0,0]
    
    //var firstNum:UInt32 = 0
    //var secondNum:UInt32 = 0
    //var thirdNum:UInt32 = 0
    //var fourthNum:UInt32 = 0
    //var fifthNum:UInt32 = 0
    
    
    var rolls = 0
//***********************************************************************************//
    
    
    
//************************************ Functions ************************************//
    
    @IBAction func Roll(_ sender: Any) {
        RollFunc()
    }


    func RollFunc() {
        //Increments a number of rolls counter
        rolls += 1
        
        //print(rolls)
        
        //This mess of if statements will let you select dice you want to keep from re rolling
        if !TopLeftSwitch.isOn {
            scores[0] = arc4random_uniform(5) + 1
            topLeft.image = UIImage(named: "Dice\(scores[0])")
        }
        
        if !TopRightSwitch.isOn {
            scores[1] = arc4random_uniform(5) + 1
            topRight.image = UIImage(named: "Dice\(scores[1])")
        }
        
        if !BottomLeftSwitch.isOn {
            scores[2] = arc4random_uniform(5) + 1
            bottomLeft.image = UIImage(named: "Dice\(scores[2])")
        }
        
        if !BottomCenterSwitch.isOn {
            scores[3] = arc4random_uniform(5) + 1
            bottomCenter.image = UIImage(named: "Dice\(scores[3])")
        }
        
        if !BottomRightSwitch.isOn {
            scores[4] = arc4random_uniform(5) + 1
            bottomRight.image = UIImage(named: "Dice\(scores[4])")
        }
        
        //limits rolls to 3
        if (rolls == 3) {
            Roll.isEnabled = false
            addScore(one:scores[0], two:scores[1], three:scores[2], four:scores[3], five:scores[4])
            CurrentScore.text = "\(scores[0] + scores[1] + scores[2] + scores[3] + scores[4])"
        }
    }
    
    func addScore(one:UInt32, two:UInt32, three:UInt32, four:UInt32, five:UInt32) {
        print(one, two, three, four, five)
        
        var highest:UInt32 = 0
        
        var turnScores: [UInt32] = [0,0,0,0,0,0,0,0,0,0,0,0]
        
        ///Chance
        turnScores[0] = one + two + three + four + five
        
        //Yahtzee
        if (one == two && two == three && three == four && four == five){
            turnScores[1] = 50
        }
        //Large stright
        
        //Small stright
        
        //4 0f a kind
        
        //3 of a kind
        
        //***************************************************************************//
        
        //Sixes
        for i in 0...4 {
            if (scores[i] == 6) {
                turnScores[6] += 6
            }
        }
        
        //Fives
        for i in 0...4 {
            if (scores[i] == 5) {
                turnScores[7] += 5
            }
        }
        
        //Fours
        for i in 0...4 {
            if (scores[i] == 4) {
                turnScores[8] += 4
            }
        }
        
        //Threes
        for i in 0...4 {
            if (scores[i] == 3) {
                turnScores[9] += 3
            }
        }
        
        //Twos
        for i in 0...4 {
            if (scores[i] == 2) {
                turnScores[10] += 2
            }
        }
        
        //Ones
        for i in 0...4 {
            if (scores[i] == 1) {
                turnScores[11] += 1
            }
        }
        
        
        //Check to see which which of turnScores is highest
        for i in 0...11 {
            if(turnScores[i] > highest) {
                highest = turnScores[i]
            }
        }
        
    }
    
    
//***********************************************************************************//

}
