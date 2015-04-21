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
    
    @IBOutlet weak var switchTest: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    var white = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1)
    var blue = UIColor(red: (58/255.0), green: (131/255.0), blue: (180/255.0), alpha: 1)
    var black = UIColor(red: (90/255.0), green: (90/255.0), blue: (90/255.0), alpha: 1)
    var red = UIColor(red: (178/255.0), green: (58/255.0), blue: (58/255.0), alpha: 1)
    var green = UIColor(red: (83/255.0), green: (162/255.0), blue: (111/255.0), alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Put this setup code in the viewDidLoad method.
    }
    
    @IBAction func switchPressed(sender: AnyObject) {
        if mySwitch.on {
            switchTest.hidden = false
        }
        else {
            switchTest.hidden = true
        }
    }
    
    @IBAction func makeBlueGreen(sender: AnyObject) {
        makeGradient(blue, rightColor: green)
    }
    
    @IBAction func makeRedBlack(sender: AnyObject) {
        makeGradient(red, rightColor: black)
    }
    
    func makeGradient(leftColor: UIColor, rightColor: UIColor) {
        var gradientColors: [CGColor] = [leftColor.CGColor, rightColor.CGColor]
        var gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
}
