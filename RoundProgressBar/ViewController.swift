//
//  ViewController.swift
//  RoundProgressBar
//
//  Created by anges on 19.01.19.
//  Copyright © 2019 anges. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var MainView: UIView!
    @IBOutlet weak var ProgressArea: ProgressBar!
    @IBOutlet weak var LblProgress: UILabel!
    @IBOutlet weak var Stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds a border to the progressArea
        ProgressArea.layer.borderWidth = 1.0
        ProgressArea.layer.borderColor = UIColor.lightGray.cgColor
        
        //Adds gradient BackgroundColor
        addGradiant()
    }
    
    
    @IBAction func StepperClicked(_ sender: Any)
    {
        if(Stepper.value < 0.1)
        {
            ProgressArea.progress = 0.0
        }
        else
        {
           ProgressArea.progress = Float(Stepper.value)
        }
        
        LblProgress.text = String(format: "%0.0f", Stepper.value * 100)
        
        print(Stepper.value)
    }
    
    
    //Gradient BackgroundColor
    func addGradiant(){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size = MainView.frame.size
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.withAlphaComponent(0.0).cgColor]
        MainView.layer.addSublayer(gradient)
    }

}

