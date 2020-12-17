//
//  ViewController.swift
//  BMI Calculator
//


import UIKit

class CalculateViewController: UIViewController {
    
    // labels
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // slider variables
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    // bmi var
    var bmiValue = "0.0"
    
    //  calculator struct
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Xcode issue with slider values in properties not showing on load
        // Have to add the values with code for now
        // https://stackoverflow.com/questions/65274058/troubles-with-starting-value-using-uislider
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 3
        heightSlider.value = 1.5
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        weightSlider.value = 100
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // convert to string & round to 2 decimal places
        let roundedHeight = String(format: "%.2f", sender.value)
        // unit of measure
        let unit = "m"
        // display text in label
        heightLabel.text = roundedHeight + unit
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        // convert to String & round to whole numer
        let roundedWeight = String(format: "%.0f", sender.value)
        // unit of measure
        let unit = "kg"
        // display text in label
        weightLabel.text = roundedWeight + unit
    }
    
    @IBAction func caculateButtonPressed(_ sender: UIButton) {
        // get weight & height values from slider
        let height = heightSlider.value
        let weight = weightSlider.value
       
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check which segue we are going to
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            // get the bmi adn set the bmi of the resultsVC
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiAdvice = calculatorBrain.getAdvice()
            destinationVC.bmiColour = calculatorBrain.getColour()
            
        }
    }
  
   
}

