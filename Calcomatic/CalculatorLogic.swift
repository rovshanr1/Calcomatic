//
//  CalculatorLogic.swift
//  Calcomatic
//
//  Created by Rovshan Rasulov on 20.03.25.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod:String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number{
            
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performNumCalculation(n2: n)
            default: intermediateCalculation = (n1: n, calcMethod: symbol)
                
            }
        }
        return nil
    }
    mutating func performNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            switch operation{
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "*":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("The operation is not supported")
            }
        }
        return nil
    }
}
