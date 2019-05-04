//
//  TwoPlayerViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/25/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController {

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
    
//************************************* Outlets *************************************//
    @IBOutlet weak var POTopLeft: UIImageView!
    @IBOutlet weak var POTopRight: UIImageView!
    @IBOutlet weak var POBottomLeft: UIImageView!
    @IBOutlet weak var POBottomCenter: UIImageView!
    @IBOutlet weak var POBottomRight: UIImageView!
    
    @IBOutlet weak var POTopLeftSwitch: UISwitch!
    @IBOutlet weak var POTopRightSwitch: UISwitch!
    @IBOutlet weak var POBottomLeftSwitch: UISwitch!
    @IBOutlet weak var POBottomCenterSwitch: UISwitch!
    @IBOutlet weak var POBottomRightSwitch: UISwitch!
    
    @IBOutlet weak var PORoll: UIButton!
    @IBOutlet weak var PONextTurn: UIButton!
//***********************************************************************************//
    @IBOutlet weak var PTBottomLeft: UIImageView!
    @IBOutlet weak var PTBottomRight: UIImageView!
    @IBOutlet weak var PTTopLeft: UIImageView!
    @IBOutlet weak var PTTopCenter: UIImageView!
    @IBOutlet weak var PTTopRight: UIImageView!
    
    @IBOutlet weak var PTBottomLeftSwitch: UISwitch!
    @IBOutlet weak var PTBottomRightSwitch: UISwitch!
    @IBOutlet weak var PTTopLeftSwitch: UISwitch!
    @IBOutlet weak var PTTopCenterSwitch: UISwitch!
    @IBOutlet weak var PTTopRightSwitch: UISwitch!
    
    @IBOutlet weak var PTRoll: UIButton!
    @IBOutlet weak var PTNextTurn: UIButton!
//***********************************************************************************//
    
    
    @IBOutlet weak var SeeScores: UIButton!
    
    
//************************************ Variables ************************************//
    var POdice: [Int] = [0,0,0,0,0]
    var PTdice: [Int] = [0,0,0,0,0]
    
    //var scores: [Int] = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0]
    
    var POhighest: Int = 0
    var PThighest: Int = 0
    var POtempHighest: Int = 0
    var PTtempHighest: Int = 0
    
    var POturnMax: Int = 0
    var PTturnMax: Int = 0
    
    
    var POrolls = 0
    var POturns = 0
    
    var PTrolls = 0
    var PTturns = 0
    
    
    @IBAction func PORoll(_ sender: Any) {
        PORollFunc()
        if (POrolls == 3) {
            POrolls = -1
        }
        POhighest = 0
    }
    
    @IBAction func PTRoll(_ sender: Any) {
        PTRollFunc()
        if (PTrolls == 3) {
            PTrolls = -1
        }
        PThighest = 0
    }
    
    
    @IBAction func PONextTurn(_ sender: Any) {
        POresetDice()
        PORoll.isHidden = false
        PORoll.isEnabled = true
        PONextTurn.isHidden = true
        POturns += 1
        if (POturns == 13) {
            SeeScores.isHidden = false
        }
        //print("\(game.scores)")
    }
    
    @IBAction func PTNextTurn(_ sender: Any) {
        PTresetDice()
        PTRoll.isHidden = false
        PTRoll.isEnabled = true
        PTNextTurn.isHidden = true
        PTturns += 1
        if (PTturns == 13) {
            SeeScores.isHidden = false
        }
        //print("\(game.scores)")
    }
    
    
    
    func PORollFunc() {
        
        if (POturns < 13) {
            //increment the rolls variable
            POrolls += 1
            
            //print("roll: \(rolls)")
            //print(turns)
            
            //This mess of if statements will let you select dice you want to keep from re rolling
            if !POTopLeftSwitch.isOn {
                POdice[0] = Int(arc4random_uniform(6) + 1)
                POTopLeft.image = UIImage(named: "Dice\(POdice[0])")
            }
            
            if !POTopRightSwitch.isOn {
                POdice[1] = Int(arc4random_uniform(6) + 1)
                POTopRight.image = UIImage(named: "Dice\(POdice[1])")
            }
            
            if !POBottomLeftSwitch.isOn {
                POdice[2] = Int(arc4random_uniform(6) + 1)
                POBottomLeft.image = UIImage(named: "Dice\(POdice[2])")
            }
            
            if !POBottomCenterSwitch.isOn {
                POdice[3] = Int(arc4random_uniform(6) + 1)
                POBottomCenter.image = UIImage(named: "Dice\(POdice[3])")
            }
            
            if !POBottomRightSwitch.isOn {
                POdice[4] = Int(arc4random_uniform(6) + 1)
                POBottomRight.image = UIImage(named: "Dice\(POdice[4])")
            }
            
            //limits rolls to 3
            if (POrolls == 3) {
                PORoll.isEnabled = false
                POdice.sort()
                POaddScore(one:POdice[0], two:POdice[1], three:POdice[2], four:POdice[3], five:POdice[4])
                //POCurrentScore.text = "\(game.scores[13])"
                PORoll.isHidden = true
                PONextTurn.isHidden = false
            }
        }
    }
    
    func PTRollFunc() {
        
        if (PTturns < 13) {
            //increment the rolls variable
            PTrolls += 1
            
            //print("roll: \(rolls)")
            //print(turns)
            
            //This mess of if statements will let you select dice you want to keep from re rolling
            if !PTTopLeftSwitch.isOn {
                PTdice[0] = Int(arc4random_uniform(6) + 1)
                PTTopLeft.image = UIImage(named: "Dice\(PTdice[0])")
            }
            
            if !PTTopRightSwitch.isOn {
                PTdice[1] = Int(arc4random_uniform(6) + 1)
                PTTopRight.image = UIImage(named: "Dice\(PTdice[1])")
            }
            
            if !PTBottomLeftSwitch.isOn {
                PTdice[2] = Int(arc4random_uniform(6) + 1)
                PTBottomLeft.image = UIImage(named: "Dice\(PTdice[2])")
            }
            
            if !PTTopCenterSwitch.isOn {
                PTdice[3] = Int(arc4random_uniform(6) + 1)
                PTTopCenter.image = UIImage(named: "Dice\(PTdice[3])")
            }
            
            if !PTBottomRightSwitch.isOn {
                PTdice[4] = Int(arc4random_uniform(6) + 1)
                PTBottomRight.image = UIImage(named: "Dice\(PTdice[4])")
            }
            
            //limits rolls to 3
            if (PTrolls == 3) {
                PTRoll.isEnabled = false
                PTdice.sort()
                PTaddScore(one:PTdice[0], two:PTdice[1], three:PTdice[2], four:PTdice[3], five:PTdice[4])
                //CurrentScore.text = "\(game.scores[13])"
                PTRoll.isHidden = true
                PTNextTurn.isHidden = false
            }
        }
    }
    
    func POresetDice() {
        if (POTopLeft.image != UIImage(named: "Dice0")) {
            POTopLeftSwitch.isOn = false
            POTopLeft.image = UIImage(named: "Dice0")
        }
        
        if (POTopRight.image != UIImage(named: "Dice0")) {
            POTopRightSwitch.isOn = false
            POTopRight.image = UIImage(named: "Dice0")
        }
        
        if (POBottomLeft.image != UIImage(named: "Dice0")) {
            POBottomLeftSwitch.isOn = false
            POBottomLeft.image = UIImage(named: "Dice0")
        }
        
        if (POBottomCenter.image != UIImage(named: "Dice0")) {
            POBottomCenterSwitch.isOn = false
            POBottomCenter.image = UIImage(named: "Dice0")
        }
        
        if (POBottomRight.image != UIImage(named: "Dice0")) {
            POBottomRightSwitch.isOn = false
            POBottomRight.image = UIImage(named: "Dice0")
        }
    }
    
    func PTresetDice() {
        if (PTTopLeft.image != UIImage(named: "Dice0")) {
            PTTopLeftSwitch.isOn = false
            PTTopLeft.image = UIImage(named: "Dice0")
        }
        
        if (PTTopRight.image != UIImage(named: "Dice0")) {
            PTTopRightSwitch.isOn = false
            PTTopRight.image = UIImage(named: "Dice0")
        }
        
        if (PTBottomLeft.image != UIImage(named: "Dice0")) {
            PTBottomLeftSwitch.isOn = false
            PTBottomLeft.image = UIImage(named: "Dice0")
        }
        
        if (PTTopCenter.image != UIImage(named: "Dice0")) {
            PTTopCenterSwitch.isOn = false
            PTTopCenter.image = UIImage(named: "Dice0")
        }
        
        if (PTBottomRight.image != UIImage(named: "Dice0")) {
            PTBottomRightSwitch.isOn = false
            PTBottomRight.image = UIImage(named: "Dice0")
        }
    }
    
    func POaddScore(one:Int, two:Int, three:Int, four:Int, five:Int) {
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
            if (POdice[i] == 6) {
                turnScores[6] += 6
            }
        }
        
        //Fives
        for i in 0...4 {
            if (POdice[i] == 5) {
                turnScores[7] += 5
            }
        }
        
        //Fours
        for i in 0...4 {
            if (POdice[i] == 4) {
                turnScores[8] += 4
            }
        }
        
        //Threes
        for i in 0...4 {
            if (POdice[i] == 3) {
                turnScores[9] += 3
            }
        }
        
        //Twos
        for i in 0...4 {
            if (POdice[i] == 2) {
                turnScores[10] += 2
            }
        }
        
        //Ones
        for i in 0...4 {
            if (POdice[i] == 1) {
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
            if (turnScores[i] > POhighest) {
                POhighest = turnScores[i]
                POturnMax = i
                print("turnMax: \(POturnMax)")
            }
        }
        
        if (game.POScores[POturnMax] == -1) {
            game.POScores[POturnMax] = turnScores[POturnMax]
        }else {
            while (game.POScores[POturnMax] != -1) {
                POtempHighest = 0
                for i in 0...12 {
                    if (turnScores[i] > POtempHighest && turnScores[i] < POhighest){
                        POturnMax = i
                        POtempHighest = turnScores[i]
                        POhighest = POtempHighest
                    }
                }
                print("Highest: \(POhighest)")
                
                if(game.POScores[POturnMax] != -1){
                    for i in stride(from: 12, to: -1, by: -1) {
                        if (game.scores[i] == -1){
                            POturnMax = i
                        }
                    }
                    
                }
            }
            game.POScores[POturnMax] = turnScores[POturnMax]
        }
        
        
        game.POScores[13] = game.POScores[13] + game.POScores[POturnMax]
        
        //print("highest: \(POhighest)")
        //print("turnMax: \(POturnMax)")
        //print("scores: \(game.POScores)")
        
    }
    
    func PTaddScore(one:Int, two:Int, three:Int, four:Int, five:Int) {
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
            if (POdice[i] == 6) {
                turnScores[6] += 6
            }
        }
        
        //Fives
        for i in 0...4 {
            if (POdice[i] == 5) {
                turnScores[7] += 5
            }
        }
        
        //Fours
        for i in 0...4 {
            if (POdice[i] == 4) {
                turnScores[8] += 4
            }
        }
        
        //Threes
        for i in 0...4 {
            if (POdice[i] == 3) {
                turnScores[9] += 3
            }
        }
        
        //Twos
        for i in 0...4 {
            if (POdice[i] == 2) {
                turnScores[10] += 2
            }
        }
        
        //Ones
        for i in 0...4 {
            if (POdice[i] == 1) {
                turnScores[11] += 1
            }
        }
        
        //print(turnScores)
        //turnScores.sort()
        //print("turnScore: \(turnScores)")
        //print(scores)
        
        //let turnResult = turnScores.enumerated().sorted(by: areInIncreasingOrder:)
        //print (turnResult)
        
        
        
        //Check to see which of turnScores is highest
        for i in 0...12 {
            if (turnScores[i] > POhighest) {
                POhighest = turnScores[i]
                POturnMax = i
                //print("turnMax: \(POturnMax)")
            }
        }
        
        if (game.POScores[POturnMax] == -1) {
            game.POScores[POturnMax] = turnScores[POturnMax]
        }else {
            while (game.POScores[POturnMax] != -1) {
                POtempHighest = 0
                for i in 0...12 {
                    if (turnScores[i] > POtempHighest && turnScores[i] < POhighest){
                        POturnMax = i
                        POtempHighest = turnScores[i]
                        POhighest = POtempHighest
                    }
                }
                //print("Highest: \(POhighest)")
                
                if(game.POScores[POturnMax] != -1){
                    for i in stride(from: 12, to: -1, by: -1) {
                        if (game.POScores[i] == -1){
                            POturnMax = i
                        }
                    }
                    
                }
            }
            game.POScores[POturnMax] = turnScores[POturnMax]
        }
        
        
        game.POScores[13] = game.POScores[13] + game.POScores[POturnMax]
        
        //print("highest: \(POhighest)")
        //print("turnMax: \(POturnMax)")
        //print("scores: \(game.POScores)")
        
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
            if (PTdice[i] == 6) {
                turnScores[6] += 6
            }
        }
        
        //Fives
        for i in 0...4 {
            if (PTdice[i] == 5) {
                turnScores[7] += 5
            }
        }
        
        //Fours
        for i in 0...4 {
            if (PTdice[i] == 4) {
                turnScores[8] += 4
            }
        }
        
        //Threes
        for i in 0...4 {
            if (PTdice[i] == 3) {
                turnScores[9] += 3
            }
        }
        
        //Twos
        for i in 0...4 {
            if (PTdice[i] == 2) {
                turnScores[10] += 2
            }
        }
        
        //Ones
        for i in 0...4 {
            if (PTdice[i] == 1) {
                turnScores[11] += 1
            }
        }
        
        //print(turnScores)
        //turnScores.sort()
        //print("turnScore: \(turnScores)")
        //print(scores)
        
        //let turnResult = turnScores.enumerated().sorted(by: areInIncreasingOrder:)
        //print (turnResult)
        
        
        
        //Check to see which of turnScores is highest
        for i in 0...12 {
            if (turnScores[i] > PThighest) {
                PThighest = turnScores[i]
                PTturnMax = i
                //print("turnMax: \(PTturnMax)")
            }
        }
        
        if (game.PTScores[PTturnMax] == -1) {
            game.PTScores[PTturnMax] = turnScores[PTturnMax]
        }else {
            while (game.PTScores[PTturnMax] != -1) {
                PTtempHighest = 0
                for i in 0...12 {
                    if (turnScores[i] > PTtempHighest && turnScores[i] < PThighest){
                        PTturnMax = i
                        PTtempHighest = turnScores[i]
                        PThighest = PTtempHighest
                    }
                }
                //print("Highest: \(PThighest)")
                
                if(game.PTScores[PTturnMax] != -1){
                    for i in stride(from: 12, to: -1, by: -1) {
                        if (game.PTScores[i] == -1){
                            PTturnMax = i
                        }
                    }
                    
                }
            }
            game.PTScores[PTturnMax] = turnScores[PTturnMax]
        }
        
        
        game.PTScores[13] = game.PTScores[13] + game.PTScores[PTturnMax]
        
        //print("highest: \(PThighest)")
        //print("turnMax: \(PTturnMax)")
        //print("scores: \(game.PTScores)")
        
    }
    
    
    
    // MARK: - ==== Navigation ====
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! TwoPlayerScoreViewController
        dest.TwoPlayerVC = self
    }
}
