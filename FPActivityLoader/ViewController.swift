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

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    @IBAction func animatingChanged(sender: UISwitch) {
         indicator.animating = sender.on
    }
    
    @IBAction func hidesIfNotAnimating(sender: UISwitch) {
        indicator.hideWhenNotAnimating = sender.on
    }
    
    @IBAction func colorChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            indicator.strokeColor = UIColor.redColor()
            break
        case 1:
            indicator.strokeColor = UIColor.greenColor()
            break
        case 2:
            indicator.strokeColor = UIColor.blueColor()
            break
        case 3:
            indicator.strokeColor = UIColor.purpleColor()
            break
            
        default:
            break
        }
    }
    @IBAction func timeChanged(sender: UISlider) {
         indicator.circleTime = Double(sender.value)
    }
    @IBAction func lineWidthChanged(sender: UISlider) {
        indicator.lineWidth = CGFloat(sender.value)
    }
}

