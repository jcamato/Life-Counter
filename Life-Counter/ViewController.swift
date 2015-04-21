//
//  ViewController.swift
//  Life-Counter
//
//  Created by Jonathan Amato on 4/20/15.
//  Copyright (c) 2015 Jonathan Amato. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    //sahand tips: unwind segue, passing data between view controllers

    var player1Life: Int = 20
    var player2Life: Int = 20
    var player1Games: Int = 0
    var player2Games: Int = 0

    @IBOutlet weak var player1LifeLabel: UILabel!
    
    @IBOutlet weak var player2LifeLabel: UILabel!
    
    @IBOutlet weak var player1GamesLabel: UILabel!
    
    @IBOutlet weak var player2GamesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func resetGames(sender: AnyObject) {
        player1Games = 0
        player1GamesLabel.text = "\(player1Games)"
        player2Games = 0
        player2GamesLabel.text = "\(player2Games)"
    }
    
    @IBAction func resetLife(sender: AnyObject) {
        player1Life = 20
        updatePlayer1Life()
        player2Life = 20
        updatePlayer2Life()
    }
    
    func updatePlayer1Life() {
        player1LifeLabel.text = "\(player1Life)"
        if (player1Life == 0) {
            player1Games += 1
            player1GamesLabel.text = "\(player1Games)"
        }
    }
    
    func updatePlayer2Life() {
        player2LifeLabel.text = "\(player2Life)"
        if (player2Life == 0) {
            player2Games += 1
            player2GamesLabel.text = "\(player2Games)"
        }
    }
    
    @IBAction func p1Plus(sender: AnyObject) {
        if (player1Life != 0) {
            player1Life += 1
            updatePlayer1Life()
        }
    }
    
    @IBAction func p1Minus(sender: AnyObject) {
        if (player1Life != 0) {
            player1Life -= 1
            updatePlayer1Life()
        }
    }
    
    @IBAction func p2Plus(sender: AnyObject) {
        if (player2Life != 0) {
            player2Life += 1
            updatePlayer2Life()
        }
    }
    
    @IBAction func p2Minus(sender: AnyObject) {
        if (player2Life != 0) {
            player2Life -= 1
            updatePlayer2Life()
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }

}

