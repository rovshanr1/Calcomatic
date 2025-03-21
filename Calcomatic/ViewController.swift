//
//  ViewController.swift
//  Calcomatic
//
//  Created by Rovshan Rasulov on 20.03.25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLable: UILabel!
    
    private var isFinisheadTyping: Bool = false
    
    private var displayValue: Double{
        get {
            guard let number = Double(displayLable.text!)
            else {
                fatalError("Cannot conver string to Double.")
            }
            return number
        }
        set{
            displayLable.text = String(newValue)
        }
    }
    
    // CalculatorLogic variable
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle{
            if isFinisheadTyping{
                displayLable.text = numValue
                isFinisheadTyping = false
            }else{
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                }
                displayLable.text = displayLable.text! + numValue
            }

        }
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        
    }
}


