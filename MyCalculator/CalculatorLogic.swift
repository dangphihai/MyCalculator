//
//  CalculatorLogic.swift
//  MyCalculator
//
//  Created by Phi Hải on 2/28/20.
//  Copyright © 2020 Phi Hải. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC", "C":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCal (n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCal(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            default:
                return n1 / n2
            }
        }
        return nil
    }
    
}
