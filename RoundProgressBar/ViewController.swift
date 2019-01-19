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
    @IBOutlet weak var Stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds gradient BackgroundColor
        addGradiant()
        
        //Adds a border to the progressArea
        ProgressArea.layer.borderWidth = 1.0
        ProgressArea.layer.borderColor = UIColor.lightGray.cgColor
        
        //Set ProgressArea and Stepper on top
        ProgressArea.layer.zPosition = 1
        Stepper.layer.zPosition = 1
    }
    
    
    @IBAction func StepperClicked(_ sender: Any)
    {
        //adjust the value to your requirements
        if(Stepper.value < 0.1)
        {
            ProgressArea.progress = 0.0
        }
        else
        {
           ProgressArea.progress = Float(Stepper.value)
        }
        
        print(Stepper.value)
    }
    
    
    //Gradient BackgroundColor
    func addGradiant(){
        let gradient: CAGradientLayer = CAGradientLayer()
        
        //To change the gradient top -> bottom to left -> right uncomment the following lines
        //gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        //gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradient.frame.size = MainView.frame.size
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        MainView.layer.addSublayer(gradient)
    }

}

