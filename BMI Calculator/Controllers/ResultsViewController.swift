//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Harry Eazy on 16/12/2020.


import UIKit

class ResultsViewController: UIViewController {
    
    // bmi value
    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColour: UIColor?
    
    // labels
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var backgroundColour: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = bmiAdvice
        backgroundColour.backgroundColor = bmiColour
        

        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        // go back to calculate VC by dismissing
        self.dismiss(animated: true, completion: nil)
    }
    

}
