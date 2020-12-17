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
        // round to 2 decimal places
        let roundedHeight = String(format: "%.2f", sender.value)
        let unit = "m"
        heightLabel.text = roundedHeight + unit
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        // round to whole numer
        let roundedWeight = String(format: "%.0f", sender.value)
        let unit = "kg"
        weightLabel.text = roundedWeight + unit
    }
    
    @IBAction func caculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / pow(height, 2)
        // create string bmi to send to second VC
        let stringBmi = String(format: "%.1f", bmi)
        
        // create object of second VC
        let secondVC = SecondViewController()
        // set bmi value of second VC
        secondVC.bmiValue = stringBmi
        
        // get current VC to present second VC
        self.present(secondVC, animated: true, completion: nil)
    }
    
    
    func updateUI(){
        
    }
    
}

