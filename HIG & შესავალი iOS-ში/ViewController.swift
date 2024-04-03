//
//  ViewController.swift
//  HIG & შესავალი iOS-ში
//
//  Created by Luka Gujejiani on 03.04.24.
//

// iPhone 15 Pro Max 🟢🔴🟢

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var divisorOrMultipleLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var anwerTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabelAndButton()
        updateTextFields()
    }
    
    //MARK: UI
    func updateLabelAndButton() {
        if modeSwitch.isOn {
            divisorOrMultipleLabel.text = "უმცირესი საერთო ჯერადი"
            calculateButton.tintColor = .red
        } else {
            divisorOrMultipleLabel.text = "უდიდესი საერთო გამყოფი"
            calculateButton.tintColor = .cyan
        }
    }
    
    func updateTextFields() {
        firstNumberTextField.placeholder = "პირველი რიცხვი"
        secondNumberTextField.placeholder = "მეორე რიცხვი"
        anwerTextField.text = "პასუხი"
        anwerTextField.textAlignment = .center
        anwerTextField.sizeToFit()
        calculateButton.setTitle("გამოთვლა", for: .normal)
    }
    
    //MARK: Actions
    @IBAction func CalculateButtonAction(_ sender: Any) {
        guard let firstNumberText = firstNumberTextField.text, let secondNumberText = secondNumberTextField.text,
              let firstNumber = Int(firstNumberText), let secondNumber = Int(secondNumberText) else {
            return
        }
        if modeSwitch.isOn {
            let result = smallestMultiple(firstNumber, secondNumber)
            anwerTextField.text = "\(result)"
        } else {
            let result = greatestDivisor(firstNumber, secondNumber)
            anwerTextField.text = "\(result)"
        }
    }
    
    @IBAction func switchAction(_ sender: Any) {
        updateLabelAndButton()
    }
    
    //MARK: Logic
    func greatestDivisor(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        var x = firstNumber
        var y = secondNumber
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return abs(x)
    }
    
    func smallestMultiple(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        return (firstNumber * secondNumber) / greatestDivisor(firstNumber, secondNumber)
    }
}

