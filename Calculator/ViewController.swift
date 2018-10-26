//
//  ViewController.swift
//  Calculator
//
//  Created by Will Kim on 10/16/18.
//  Copyright © 2018 Will Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcDisplay: UILabel!
    var displayInput : String = "0"
    
    var input : Float = 0
    var inputStore : Float = 0
    var numSign : String = ""
    
    var returnResult : Float = 0
    
    var numInput : Bool = false
    var resultInput : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numButton(_ sender: UIButton) {
        
        // IF THE INPUT IS NUMBER
        if (sender.tag < 10 || sender.tag == 12 || sender.tag == 18) {
            if (sender.tag == 12) {
                if displayInput.range(of:".") != nil {
                    print("Decimal already exists") // Input decimal places more than once
                } else {
                    displayInput += "." // Adding decimal places
                }
            } else if (sender.tag == 18) { // Remove last digit
                if (displayInput.count < 2) {
                    displayInput = "0"
                } else {
                    displayInput.remove(at: displayInput.index(before: displayInput.endIndex))
                }
            } else {
                if (displayInput == "0") {
                    displayInput = ""
                }
                displayInput += String(sender.tag)
            }
            
            input = Float(displayInput) ?? 0
            calcDisplay.text = displayInput
            
            numInput = true
            resultInput = false
            
        } else {
            
            // IF THE INPUT IS SYMBOLS
            // ====================== INPUT -> =
            
            displayInput = ""
            
            if (sender.tag == 10) {
                if (numSign == "+") {
                    returnResult = inputStore + input
                } else if (numSign == "-") {
                    returnResult = inputStore - input
                } else if (numSign == "") {
                    returnResult = input
                    input = 0
                }
                numSign = "="
                calcDisplay.text = String(returnResult.clean)
                
                numInput = false
                resultInput = true
                
            // ====================== INPUT -> +
            } else if (sender.tag == 13) {
                if (input > 0 && numSign != "=") {
                    inputStore += input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "+"
                input = 0
                
                calcDisplay.text = String(inputStore.clean)
                
                numInput = false
                resultInput = true
            // ====================== INPUT -> -
            } else if (sender.tag == 14) {
                
                if (numSign == "-") {
                    inputStore -= input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "-"
                input = 0
                
                calcDisplay.text = String(inputStore.clean)
                
                numInput = false
                resultInput = true
                
            } else if (sender.tag == 17) { // %
                
            // ====================== INPUT -> AC/C
            } else if (sender.tag == 19) {
                // RESET EVERYTHING!
                input = 0
                inputStore = 0
                returnResult = 0
                numSign = ""
                
                calcDisplay.text = String(input.clean)
            }
        }
        
        print("inputStore", inputStore, "input", input, "returnResult", returnResult, "numSign", numSign)
    }
    
//    func toggleInputSetting (_ numSetting: Bool, _ resSetting: Bool) {
//        if (numSetting == false && resSetting == true) {
//            numInput = true
//            resultInput = false
//        } else if (numSetting == true && resSetting == false) {
//            numInput = false
//            resultInput = true
//        }
//    }
    
//    TAGS = SYMBOLS
//    10 = '='
//    11 = 'save'
//    12 = '.'
//    13 = '+'
//    14 = '-'
//    15 = 'x'
//    16 = '÷'
//    17 = '%'
//    18 = '+/-'
//    19 = 'AC/C'
    
}

// Clean - Remove any flying '0's on decimal (or remove dec)
extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
