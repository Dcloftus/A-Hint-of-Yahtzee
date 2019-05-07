//
//  OnePlayerViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/25/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
    
    var game = Game()
    
//********************************** MAIN FUNCTIONS **********************************//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Menu(_ sender: Any) {
    }
    
    
    @IBAction func SeeScores(_ sender: Any) {
    }
    
    

//***********************************************************************************//
    
    
    
    
    
//************************************* Outlets *************************************//
    
    @IBOutlet weak var topLeft: UIImageView!
    
    @IBOutlet weak var topRight: UIImageView!
    
    @IBOutlet weak var bottomLeft: UIImageView!
    
    @IBOutlet weak var bottomCenter: UIImageView!
    
    @IBOutlet weak var bottomRight: UIImageView!
    

    @IBOutlet weak var Roll: UIButton!
    
    @IBOutlet weak var nextTurn: UIButton!
    
    @IBOutlet weak var SeeScores: UIButton!
    
    
    @IBOutlet weak var TopLeftSwitch: UISwitch!
    
    @IBOutlet weak var TopRightSwitch: UISwitch!
    
    @IBOutlet weak var BottomLeftSwitch: UISwitch!
    
    @IBOutlet weak var BottomCenterSwitch: UISwitch!
    
    @IBOutlet weak var BottomRightSwitch: UISwitch!
    
    
    @IBOutlet weak var CurrentScore: UILabel!
    
    
//***********************************************************************************//
    
    
    
//************************************ Variables ************************************//
    var dice: [Int] = [0,0,0,0,0]
    
    //var scores: [Int] = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0]
    
    var highest: Int = 0
    var tempHighest: Int = 0
    
    var turnMax: Int = 0
    
    
    
    
    //var firstNum:UInt32 = 0
    //var secondNum:UInt32 = 0
    //var thirdNum:UInt32 = 0
    //var fourthNum:UInt32 = 0
    //var fifthNum:UInt32 = 0
    
    
    var rolls = 0
    var turns = 0
//***********************************************************************************//
    
    
    
//************************************ Functions ************************************//
    
    @IBAction func Roll(_ sender: Any) {
        RollFunc()
        if (rolls == 3) {
            rolls = -1
        }
        highest = 0
    }
    @IBAction func nextTurn(_ sender: Any) {
        resetDice()
        Roll.isHidden = false
        Roll.isEnabled = true
        nextTurn.isHidden = true
        turns += 1
        if (turns == 13) {
            SeeScores.isHidden = false
        }
        print("\(game.scores)")
    }
    
    
    
    func RollFunc() {
        
        if (turns < 13) {
            //increment the rolls variable
            rolls += 1
            
            print("roll: \(rolls)")
            //print(turns)
        
            //This mess of if statements will let you select dice you want to keep from re rolling
            if !TopLeftSwitch.isOn {
                dice[0] = Int(arc4random_uniform(6) + 1)
                topLeft.image = UIImage(named: "Dice\(dice[0])")
            }
        
            if !TopRightSwitch.isOn {
                dice[1] = Int(arc4random_uniform(6) + 1)
                topRight.image = UIImage(named: "Dice\(dice[1])")
            }
        
            if !BottomLeftSwitch.isOn {
                dice[2] = Int(arc4random_uniform(6) + 1)
                bottomLeft.image = UIImage(named: "Dice\(dice[2])")
            }
        
            if !BottomCenterSwitch.isOn {
                dice[3] = Int(arc4random_uniform(6) + 1)
                bottomCenter.image = UIImage(named: "Dice\(dice[3])")
            }
        
            if !BottomRightSwitch.isOn {
                dice[4] = Int(arc4random_uniform(6) + 1)
                bottomRight.image = UIImage(named: "Dice\(dice[4])")
            }
        
            //limits rolls to 3
            if (rolls == 3) {
                Roll.isEnabled = false
                dice.sort()
                addScore(one:dice[0], two:dice[1], three:dice[2], four:dice[3], five:dice[4])
                CurrentScore.text = "\(game.scores[13])"
                Roll.isHidden = true
                nextTurn.isHidden = false
            }
        }
    }
    
    func resetDice() {
        if (topLeft.image != UIImage(named: "Dice0")) {
            TopLeftSwitch.isOn = false
            topLeft.image = UIImage(named: "Dice0")
        }
        
        if (topRight.image != UIImage(named: "Dice0")) {
            TopRightSwitch.isOn = false
            topRight.image = UIImage(named: "Dice0")
        }
        
        if (bottomLeft.image != UIImage(named: "Dice0")) {
            BottomLeftSwitch.isOn = false
            bottomLeft.image = UIImage(named: "Dice0")
        }
        
        if (bottomCenter.image != UIImage(named: "Dice0")) {
            BottomCenterSwitch.isOn = false
            bottomCenter.image = UIImage(named: "Dice0")
        }
        
        if (bottomRight.image != UIImage(named: "Dice0")) {
            BottomRightSwitch.isOn = false
            bottomRight.image = UIImage(named: "Dice0")
        }
    }
    
    func addScore(one:Int, two:Int, three:Int, four:Int, five:Int) {
        print("dice: \(one), \(two), \(three), \(four), \(five)")
        
        //var highest:UInt32 = 0
        
        var turnScores: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        ///Chance
        turnScores[12] = one + two + three + four + five
        
        //Yahtzee
        if (one == two && two == three && three == four && four == five){
            turnScores[0] = 50
        }
        //Large stright
        if ((one == 1 && two == 2 && three == 3 && four == 4 && five == 5)||(one == 2 && two == 3 && three == 4 && four == 5 && five == 6)){
            turnScores[1] = 40
        }
        
        //Small stright
        if ((one == 1 && two == 2 && three == 3 && four == 4)||(one == 2 && two == 3 && three == 4 && four == 5)||(one == 3 && two == 4 && three == 5 && four == 6)||(two == 1 && three == 2 && four == 3 && five == 4)||(two == 2 && three == 3 && four == 4 && five == 5)||(two == 3 && three == 4 && four == 5 && five == 6)){
            turnScores[2] = 30
        }
        
        //Full house
        if ((one == two && two == three && four == five) || (one == two && three == four && four == five)){
            turnScores[3] = 25
        }
        
        //4 0f a kind
        if ((one == two && two == three && three == four)||(two == three && three == four && four == five)){
            turnScores[4] = one + two + three + four + five
        }
        
        //3 of a kind
        if ((one == two && two == three)||(two == three && three == four)||(three == four && four == five)){
            turnScores[5] = one + two + three + four + five
        }
        
        //***************************************************************************//
        
        //Sixes
        for i in 0...4 {
            if (dice[i] == 6) {
                turnScores[6] += 6
            }
        }
        
        //Fives
        for i in 0...4 {
            if (dice[i] == 5) {
                turnScores[7] += 5
            }
        }
        
        //Fours
        for i in 0...4 {
            if (dice[i] == 4) {
                turnScores[8] += 4
            }
        }
        
        //Threes
        for i in 0...4 {
            if (dice[i] == 3) {
                turnScores[9] += 3
            }
        }
        
        //Twos
        for i in 0...4 {
            if (dice[i] == 2) {
                turnScores[10] += 2
            }
        }
        
        //Ones
        for i in 0...4 {
            if (dice[i] == 1) {
                turnScores[11] += 1
            }
        }
        
        //print(turnScores)
        //turnScores.sort()
        print("turnScore: \(turnScores)")
        //print(scores)
        
        //let turnResult = turnScores.enumerated().sorted(by: areInIncreasingOrder:)
        //print (turnResult)
        
        
        
        //Check to see which of turnScores is highest
        for i in 0...12 {
            if (turnScores[i] > highest) {
                highest = turnScores[i]
                turnMax = i
                print("turnMax: \(turnMax)")
            }
        }
        
        if (game.scores[turnMax] == -1) {
            game.scores[turnMax] = turnScores[turnMax]
        }else {
            while (game.scores[turnMax] != -1) {
                tempHighest = 0
                for i in 0...12 {
                    if (turnScores[i] > tempHighest && turnScores[i] < highest){
                        turnMax = i
                        tempHighest = turnScores[i]
                        highest = tempHighest
                    }
                }
                print("Highest: \(highest)")
                
                if(game.scores[turnMax] != -1){
                    for i in stride(from: 12, to: -1, by: -1) {
                        if (game.scores[i] == -1){
                            turnMax = i
                        }
                    }
                
                }
            }
            game.scores[turnMax] = turnScores[turnMax]
        }
        
        
        game.scores[13] = game.scores[13] + game.scores[turnMax]
        
        print("highest: \(highest)")
        print("turnMax: \(turnMax)")
        print("scores: \(game.scores)")
        
        
    }
    
    
//***********************************************************************************//
    
    // MARK: - ==== Navigation ====
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toScore":
            let dest = segue.destination as! OnePlayerScoreViewController
            dest.OnePlayerVC = self
        case "toMain":
            let main = segue.destination as! MainMenuViewController
            main.OnePlayerVC = self
        default: break
        }
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! OnePlayerScoreViewController
        dest.OnePlayerVC = self
    }
    */
}
