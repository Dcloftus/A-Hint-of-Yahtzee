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
    var dice: [UInt32] = [0,0,0,0,0]
    
    var scores: [UInt32] = [51,51,51,51,51,51,51,51,51,51,51,51,51]
    
    var highest: UInt32 = 0
    
    var turnMax: Int = 0
    
    
    
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
            dice[0] = arc4random_uniform(5) + 1
            topLeft.image = UIImage(named: "Dice\(dice[0])")
        }
        
        if !TopRightSwitch.isOn {
            dice[1] = arc4random_uniform(5) + 1
            topRight.image = UIImage(named: "Dice\(dice[1])")
        }
        
        if !BottomLeftSwitch.isOn {
            dice[2] = arc4random_uniform(5) + 1
            bottomLeft.image = UIImage(named: "Dice\(dice[2])")
        }
        
        if !BottomCenterSwitch.isOn {
            dice[3] = arc4random_uniform(5) + 1
            bottomCenter.image = UIImage(named: "Dice\(dice[3])")
        }
        
        if !BottomRightSwitch.isOn {
            dice[4] = arc4random_uniform(5) + 1
            bottomRight.image = UIImage(named: "Dice\(dice[4])")
        }
        
        //limits rolls to 3
        if (rolls == 3) {
            Roll.isEnabled = false
            dice.sort()
            addScore(one:dice[0], two:dice[1], three:dice[2], four:dice[3], five:dice[4])
            CurrentScore.text = "\(dice[0] + dice[1] + dice[2] + dice[3] + dice[4])"
        }
    }
    
    func addScore(one:UInt32, two:UInt32, three:UInt32, four:UInt32, five:UInt32) {
        print(one, two, three, four, five)
        
        //var highest:UInt32 = 0
        
        var turnScores: [UInt32] = [0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        ///Chance
        turnScores[0] = one + two + three + four + five
        
        //Yahtzee
        if (one == two && two == three && three == four && four == five){
            turnScores[1] = 50
        }
        //Large stright
        if ((one == 1 && two == 2 && three == 3 && four == 4 && five == 5)||(one == 2 && two == 3 && three == 4 && four == 5 && five == 6)){
            turnScores[2] = 40
        }
        
        //Small stright
        if ((one == 1 && two == 2 && three == 3 && four == 4)||(one == 2 && two == 3 && three == 4 && four == 5)||(one == 3 && two == 4 && three == 5 && four == 6)||(two == 1 && three == 2 && four == 3 && five == 4)||(two == 2 && three == 3 && four == 4 && five == 5)||(two == 3 && three == 4 && four == 5 && five == 6)){
            turnScores[3] = 30
        }
        
        //Full house
        if ((one == two && two == three && four == five) || (one == two && three == four && four == five)){
            turnScores[4] = 25
        }
        
        //4 0f a kind
        if ((one == two && two == three && three == four)||(two == three && three == four && four == five)){
            turnScores[5] = one + two + three + four + five
        }
        
        //3 of a kind
        if ((one == two && two == three)||(two == three && three == four)||(three == four && four == five)){
            turnScores[6] = one + two + three + four + five
        }
        
        //***************************************************************************//
        
        //Sixes
        for i in 0...4 {
            if (dice[i] == 6) {
                turnScores[7] += 6
            }
        }
        
        //Fives
        for i in 0...4 {
            if (dice[i] == 5) {
                turnScores[8] += 5
            }
        }
        
        //Fours
        for i in 0...4 {
            if (dice[i] == 4) {
                turnScores[9] += 4
            }
        }
        
        //Threes
        for i in 0...4 {
            if (dice[i] == 3) {
                turnScores[10] += 3
            }
        }
        
        //Twos
        for i in 0...4 {
            if (dice[i] == 2) {
                turnScores[11] += 2
            }
        }
        
        //Ones
        for i in 0...4 {
            if (dice[i] == 1) {
                turnScores[12] += 1
            }
        }
        
        //print(turnScores)
        //turnScores.sort()
        print(turnScores)
        print(scores)
        
        
        
        //Check to see which of turnScores is highest
        for i in 0...12 {
            if (turnScores[i] > highest) {
                highest = turnScores[i]
                turnMax = i
            }
        }
        
        if (scores[turnMax] == 51) {
            scores[turnMax] = turnScores[turnMax]
        }else {
            while (scores[turnMax] != 51) {
                for i in 0...12 {
                    if (turnScores[i] < highest){
                        turnMax = i
                        highest = turnScores[i]
                    }
                }
            }
            scores[turnMax] = turnScores[turnMax]
        }
            
            
        print(highest)
        print(turnMax)
        print(scores)
    }
    
    
//***********************************************************************************//

}
