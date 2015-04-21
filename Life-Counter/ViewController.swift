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
    
    @IBOutlet weak var dice1Image: UIImageView!
    
    @IBOutlet weak var dice2Image: UIImageView!
    
    var blue = UIColor(red: (58/255.0), green: (131/255.0), blue: (180/255.0), alpha: 1)
    var green = UIColor(red: (83/255.0), green: (162/255.0), blue: (111/255.0), alpha: 1)

    func makeGradient() {
        var gradientColors: [CGColor] = [green.CGColor, blue.CGColor]
        var gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradient()
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
        player1LifeLabel.textColor = UIColor.blackColor()
        player2Life = 20
        updatePlayer2Life()
        player2LifeLabel.textColor = UIColor.blackColor()
    }
    
    func updatePlayer1Life() {
        player1LifeLabel.text = "\(player1Life)"
        if (player1Life == 0) {
            player1Games += 1
            player1GamesLabel.text = "\(player1Games)"
            player1LifeLabel.textColor = UIColor.redColor()
        }
    }
    
    func updatePlayer2Life() {
        player2LifeLabel.text = "\(player2Life)"
        if (player2Life == 0) {
            player2Games += 1
            player2GamesLabel.text = "\(player2Games)"
            player2LifeLabel.textColor = UIColor.redColor()
        }
    }
    
    @IBAction func p1Plus(sender: AnyObject) {
        if (player1Life != 0) && (player2Life != 0) {
            player1Life += 1
            updatePlayer1Life()
        }
    }
    
    @IBAction func p1Minus(sender: AnyObject) {
        if (player1Life != 0) && (player2Life != 0) {
            player1Life -= 1
            updatePlayer1Life()
        }
    }
    
    @IBAction func p2Plus(sender: AnyObject) {
        if (player2Life != 0) && (player1Life != 0) {
            player2Life += 1
            updatePlayer2Life()
        }
    }
    
    @IBAction func p2Minus(sender: AnyObject) {
        if (player2Life != 0) && (player1Life != 0) {
            player2Life -= 1
            updatePlayer2Life()
        }
    }
    
    @IBAction func rollDice(sender: AnyObject) {
        var dice1 = 1 + Int(arc4random_uniform(UInt32(6)))
        var dice2 = 1 + Int(arc4random_uniform(UInt32(6)))
        dice1Image.image = UIImage(named:"dice\(dice1).png")
        dice2Image.image = UIImage(named:"dice\(dice2).png")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }

}

