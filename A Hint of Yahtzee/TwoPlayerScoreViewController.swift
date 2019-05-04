//
//  TPScoreViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 5/3/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class TwoPlayerScoreViewController: UIViewController {
    
    @IBOutlet weak var POAcesLabel: UILabel!
    @IBOutlet weak var POTwosLabel: UILabel!
    @IBOutlet weak var POThreesLabel: UILabel!
    @IBOutlet weak var POFoursLabel: UILabel!
    @IBOutlet weak var POFivesLabel: UILabel!
    @IBOutlet weak var POSixesLabel: UILabel!
    @IBOutlet weak var PO3OKLabel: UILabel!
    @IBOutlet weak var PO4OKLabel: UILabel!
    @IBOutlet weak var POFullHouseLabel: UILabel!
    @IBOutlet weak var POSMStraightLabel: UILabel!
    @IBOutlet weak var POLGStraightLabel: UILabel!
    @IBOutlet weak var POYahtzeeLabel: UILabel!
    @IBOutlet weak var POChanceLabel: UILabel!
    @IBOutlet weak var POGrandTotalLabel: UILabel!
    
    @IBOutlet weak var PTAcesLabel: UILabel!
    @IBOutlet weak var PTTwosLabel: UILabel!
    @IBOutlet weak var PTThreesLabel: UILabel!
    @IBOutlet weak var PTFoursLabel: UILabel!
    @IBOutlet weak var PTFivesLabel: UILabel!
    @IBOutlet weak var PTSixesLabel: UILabel!
    @IBOutlet weak var PT3OKLabel: UILabel!
    @IBOutlet weak var PT4OKLabel: UILabel!
    @IBOutlet weak var PTFullHouseLabel: UILabel!
    @IBOutlet weak var PTSMStraightLabel: UILabel!
    @IBOutlet weak var PTLGStraightLabel: UILabel!
    @IBOutlet weak var PTYahtzeeLabel: UILabel!
    @IBOutlet weak var PTChanceLabel: UILabel!
    @IBOutlet weak var PTGrandTotalLabel: UILabel!
    
    
    var TwoPlayerVC: TwoPlayerViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //print(OnePlayerVC?.game.scores)
        
        POYahtzeeLabel.text = String(describing: (TwoPlayerVC?.game.POScores[0])!)
        POLGStraightLabel.text = String(describing: (TwoPlayerVC?.game.POScores[1])!)
        POSMStraightLabel.text = String(describing: (TwoPlayerVC?.game.POScores[2])!)
        POFullHouseLabel.text = String(describing: (TwoPlayerVC?.game.POScores[3])!)
        PO4OKLabel.text = String(describing: (TwoPlayerVC?.game.POScores[4])!)
        PO3OKLabel.text = String(describing: (TwoPlayerVC?.game.POScores[5])!)
        POSixesLabel.text = String(describing: (TwoPlayerVC?.game.POScores[6])!)
        POFivesLabel.text = String(describing: (TwoPlayerVC?.game.POScores[7])!)
        POFoursLabel.text = String(describing: (TwoPlayerVC?.game.POScores[8])!)
        POThreesLabel.text = String(describing: (TwoPlayerVC?.game.POScores[9])!)
        POTwosLabel.text = String(describing: (TwoPlayerVC?.game.POScores[10])!)
        POAcesLabel.text = String(describing: (TwoPlayerVC?.game.POScores[11])!)
        POChanceLabel.text = String(describing: (TwoPlayerVC?.game.POScores[12])!)
        POGrandTotalLabel.text = String(describing: (TwoPlayerVC?.game.POScores[13])!)
        
        PTYahtzeeLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[0])!)
        PTLGStraightLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[1])!)
        PTSMStraightLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[2])!)
        PTFullHouseLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[3])!)
        PT4OKLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[4])!)
        PT3OKLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[5])!)
        PTSixesLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[6])!)
        PTFivesLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[7])!)
        PTFoursLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[8])!)
        PTThreesLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[9])!)
        PTTwosLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[10])!)
        PTAcesLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[11])!)
        PTChanceLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[12])!)
        PTGrandTotalLabel.text = String(describing: (TwoPlayerVC?.game.PTScores[13])!)
        
    }
    

    

}
