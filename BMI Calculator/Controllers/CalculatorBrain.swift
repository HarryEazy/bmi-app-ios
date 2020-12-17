//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Harry Eazy on 16/12/2020.

import UIKit


struct CalculatorBrain {
    
    // store bmi in string
    var bmi: BMI?
    
    
    mutating func calculateBMI(height: Float, weight: Float){
        
        // calculate bmi
        let bmi = weight / pow(height, 2)
        // convert bmi to string and store in bmiValue
        
        var bmiAdvice = ""
        var colour = #colorLiteral(red: 0.9708172679, green: 0.735368669, blue: 0.8108538389, alpha: 1)
        
        // set suitable advice and colour dependant on bmi result
        if bmi < 18.5 {
            bmiAdvice = "Eat more pies!"
            colour = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        } else if bmi <= 24.9{
            bmiAdvice = "Normal weight :)"
            colour = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            bmiAdvice = "Overweight"
            colour = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        // create BMI struct
        self.bmi = BMI(value: bmi, advice: bmiAdvice, colour: colour)
    }
    
    // getter for bmi
    func getBMIValue() -> String {
        let bmiToString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToString
    }
    
    // getter for bmi advice
    func getAdvice() -> String {
        let bmiAdvice = bmi?.advice ?? " Error"
        return bmiAdvice
    }
    
    func getColour() -> UIColor {
        let bmiColour = bmi?.colour ?? #colorLiteral(red: 0.9708172679, green: 0.735368669, blue: 0.8108538389, alpha: 1)
        return bmiColour
    }
    
    
    
    
}
