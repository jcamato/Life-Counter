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

    var player1Life: Int = 20
    var player2Life: Int = 20
    
    var player1Games: Int = 0
    var player2Games: Int = 0
    
    var player1Infect: Int = 0
    var player2Infect: Int = 0
    
    @IBOutlet weak var player1View: UIView!
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var gamesView: UIView!
    @IBOutlet weak var diceView: UIView!
    @IBOutlet weak var resetButton: UIButton!

    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var infectButton: UISwitch!
    @IBOutlet weak var diceButton: UISwitch!
    
    @IBOutlet weak var player1LifeLabel: UILabel!
    @IBOutlet weak var player2LifeLabel: UILabel!
    
    @IBOutlet weak var player1GamesLabel: UILabel!
    @IBOutlet weak var player2GamesLabel: UILabel!
    
    @IBOutlet weak var player1InfectLabel: UILabel!
    @IBOutlet weak var player1InfectUndoLabel: UIButton!
    @IBOutlet weak var player1InfectButton: UIButton!
    
    @IBOutlet weak var player2InfectLabel: UILabel!
    @IBOutlet weak var player2InfectUndoLabel: UIButton!
    @IBOutlet weak var player2InfectButton: UIButton!
    
    @IBOutlet weak var dice1Image: UIImageView!
    @IBOutlet weak var dice2Image: UIImageView!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var rollDiceButton: UIButton!
    
    var green = UIColor(red: (83/255.0), green: (162/255.0), blue: (111/255.0), alpha: 1)
    var blue = UIColor(red: (58/255.0), green: (131/255.0), blue: (180/255.0), alpha: 1)
    
    var yellow = UIColor(red: (211/255.0), green: (182/255.0), blue: (76/255.0), alpha: 1)
    var orange = UIColor(red: (228/255.0), green: (116/255.0), blue: (52/255.0), alpha: 1)
    
    var pink = UIColor(red: (190/255.0), green: (65/255.0), blue: (65/255.0), alpha: 1)
    var purple = UIColor(red: (152/255.0), green: (81/255.0), blue: (214/255.0), alpha: 1)

    func makeGradient(leftColor: UIColor, rightColor: UIColor) {
        var gradientColors: [CGColor] = [leftColor.CGColor, rightColor.CGColor]
        var gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeGradient(green, rightColor: blue)
        
        showMain()
        
        player1InfectUndoLabel.alpha = 0
        player2InfectUndoLabel.alpha = 0
        
        UIApplication.sharedApplication().idleTimerDisabled = true
    }
    
    func gameHasEnded() -> Bool {
        return (player1Life == 0) || (player2Life == 0) || (player1Infect == -10) || (player2Infect == -10)
    }
    
    @IBAction func resetGames(sender: AnyObject) {
        player1Games = 0
        player1GamesLabel.text = "\(player1Games)"
        player2Games = 0
        player2GamesLabel.text = "\(player2Games)"
    }
    
    @IBAction func resetLife(sender: AnyObject) {
        player1Life = 20
        player1Infect = 0
        updatePlayer1Life()
        updatePlayer1Infect()
        player1LifeLabel.textColor = UIColor.blackColor()
        player2Life = 20
        player2Infect = 0
        updatePlayer2Life()
        updatePlayer2Infect()
        player2LifeLabel.textColor = UIColor.blackColor()
    }
    
    func updatePlayer1Life() {
        player1LifeLabel.text = "\(player1Life)"
        if (player1Life == 0) {
            player2Games += 1
            player2GamesLabel.text = "\(player2Games)"
            player1LifeLabel.textColor = UIColor.redColor()
        }
    }
    
    func updatePlayer1Infect() {
        player1InfectLabel.text = "\(player1Infect)"
        player1InfectLabel.alpha = 1
        player1InfectUndoLabel.alpha = 1
        if (player1Infect == 0) {
            player1InfectLabel.alpha = 0
            player1InfectUndoLabel.alpha = 0
        }
        else if (player1Infect == -10) {
            player2Games += 1
            player2GamesLabel.text = "\(player2Games)"
            player1LifeLabel.textColor = UIColor.redColor()
        }
    }
    
    @IBAction func p1Plus(sender: AnyObject) {
        if (gameHasEnded() == false) {
            player1Life += 1
            updatePlayer1Life()
        }
    }
    
    @IBAction func p1Minus(sender: AnyObject) {
        if (gameHasEnded() == false) {
            player1Life -= 1
            updatePlayer1Life()
        }
    }
    
    @IBAction func p1Infect(sender: AnyObject) {
        if (gameHasEnded() == false) {
            player1Infect -= 1
            updatePlayer1Infect()
        }
    }
    
    @IBAction func p1InfectUndo(sender: AnyObject) {
        if (gameHasEnded() == false) && (player1Infect < 0) {
            player1Infect += 1
            updatePlayer1Infect()
        }
    }
    
    func updatePlayer2Life() {
        player2LifeLabel.text = "\(player2Life)"
        if (player2Life == 0) {
            player1Games += 1
            player1GamesLabel.text = "\(player1Games)"
            player2LifeLabel.textColor = UIColor.redColor()
        }
    }
    
    func updatePlayer2Infect() {
        player2InfectLabel.text = "\(player2Infect)"
        player2InfectLabel.alpha = 1
        player2InfectUndoLabel.alpha = 1
        if (player2Infect == 0) {
            player2InfectLabel.alpha = 0
            player2InfectUndoLabel.alpha = 0
        }
        else if (player2Infect == -10) {
            player1Games += 1
            player1GamesLabel.text = "\(player1Games)"
            player2LifeLabel.textColor = UIColor.redColor()
        }
    }
    
    @IBAction func p2Plus(sender: AnyObject) {
        if (gameHasEnded() == false) {
            player2Life += 1
            updatePlayer2Life()
        }
    }
    
    @IBAction func p2Minus(sender: AnyObject) {
        if (gameHasEnded() == false) {
            player2Life -= 1
            updatePlayer2Life()
        }
    }
    
    @IBAction func p2Infect(sender: AnyObject) {
        if (gameHasEnded() == false) {
            player2Infect -= 1
            updatePlayer2Infect()
        }
    }
    
    @IBAction func p2InfectUndo(sender: AnyObject) {
        if (gameHasEnded() == false) && (player2Infect < 0) {
            player2Infect += 1
            updatePlayer2Infect()
        }
    }
    
    @IBAction func rollDice(sender: AnyObject) {
        var dice1 = 1 + Int(arc4random_uniform(UInt32(6)))
        var dice2 = 1 + Int(arc4random_uniform(UInt32(6)))
        dice1Image.image = UIImage(named: "Dice\(dice1)")
        dice2Image.image = UIImage(named: "Dice\(dice2)")
    }
    
    func hideInfect() {
        player1InfectLabel.hidden = true
        player1InfectUndoLabel.hidden = true
        player1InfectButton.hidden = true
        player2InfectLabel.hidden = true
        player2InfectUndoLabel.hidden = true
        player2InfectButton.hidden = true
    }
    
    func showInfect() {
        player1InfectLabel.hidden = false
        player1InfectUndoLabel.hidden = false
        player1InfectButton.hidden = false
        player2InfectLabel.hidden = false
        player2InfectUndoLabel.hidden = false
        player2InfectButton.hidden = false
    }
    
    func hideDice() {
        dice1Image.hidden = true
        dice2Image.hidden = true
        rollDiceButton.hidden = true
    }
    
    func showDice() {
        dice1Image.hidden = false
        dice2Image.hidden = false
        rollDiceButton.hidden = false
    }
    
    @IBAction func showSettings(sender: AnyObject) {
        showSettings()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        showMain()
    }
    
    @IBAction func showInfectButton(sender: AnyObject) {
        if infectButton.on {
            showInfect()
        } else {
            hideInfect()
        }
    }
    
    @IBAction func showDiceButton(sender: AnyObject) {
        if diceButton.on {
            showDice()
        } else {
            hideDice()
        }
    }
    
    @IBAction func greenBlueGradient(sender: AnyObject) {
        self.view.layer.sublayers.removeAtIndex(0)
        makeGradient(green, rightColor: blue)
    }
    
    @IBAction func yellowOrangeGradient(sender: AnyObject) {
        self.view.layer.sublayers.removeAtIndex(0)
        makeGradient(yellow, rightColor: orange)
    }
    
    @IBAction func pinkPurpleGradient(sender: AnyObject) {
        self.view.layer.sublayers.removeAtIndex(0)
        makeGradient(pink, rightColor: purple)
    }
    
    func showSettings() {
        player1View.hidden = true
        player2View.hidden = true
        gamesView.hidden = true
        diceView.hidden = true
        resetButton.hidden = true
        settingsButton.hidden = true
        backButton.hidden = false
        settingsView.hidden = false
    }
    
    func showMain() {
        player1View.hidden = false
        player2View.hidden = false
        gamesView.hidden = false
        diceView.hidden = false
        resetButton.hidden = false
        settingsButton.hidden = false
        backButton.hidden = true
        settingsView.hidden = true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }

}

