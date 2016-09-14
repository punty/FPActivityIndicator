//
//  ViewController.swift
//  FPActivityLoader
//
//  Created by Francesco Puntillo on 04/04/2016.
//  Copyright © 2016 Francesco Puntillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBOutlet weak var indicator: FPActivityLoader!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func animatingChanged(_ sender: UISwitch) {
        indicator.animating = sender.isOn
    }
    
    @IBAction func hidesIfNotAnimating(_ sender: UISwitch) {
        indicator.hideWhenNotAnimating = sender.isOn
    }
    
    @IBAction func colorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            indicator.strokeColor = UIColor.red
            break
        case 1:
            indicator.strokeColor = UIColor.green
            break
        case 2:
            indicator.strokeColor = UIColor.blue
            break
        case 3:
            indicator.strokeColor = UIColor.purple
            break
            
        default:
            break
        }
    }
    @IBAction func timeChanged(_ sender: UISlider) {
        indicator.circleTime = Double(sender.value)
    }
    @IBAction func lineWidthChanged(_ sender: UISlider) {
        indicator.lineWidth = CGFloat(sender.value)
    }
}

