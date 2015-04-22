//
//  SettingsViewController.swift
//  Life-Counter
//
//  Created by Jonathan Amato on 4/20/15.
//  Copyright (c) 2015 Jonathan Amato. All rights reserved.
//

import UIKit
import QuartzCore

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var infectButton: UISwitch!
    @IBOutlet weak var diceButton: UISwitch!
    
    var hideInfect : Bool = false
    var hideDice : Bool = false
    
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
    
    @IBAction func showInfect(sender: AnyObject) {
        if infectButton.on {
            hideInfect = false
        } else {
            hideInfect = true
        }
    }
    
    @IBAction func showDice(sender: AnyObject) {
        if diceButton.on {
            hideDice = false
        } else {
            hideDice = true
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var mainVC: ViewController = segue.destinationViewController as! ViewController
        
        if hideInfect {
            mainVC.Infect == "1"
            
        } else {
            mainVC.Infect == "0"
        }
        
        if hideDice {
            mainVC.Dice == "1"
        } else {
            mainVC.Dice == "0"
        }

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    
}
