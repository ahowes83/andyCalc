//
//  CalcBrain.swift
//  andyCalc
//
//  Created by Andrew Howes on 3/19/15.
//  Copyright (c) 2015 Andrew Howes. All rights reserved.
//

import Foundation

class CalcBrain
    {
    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
   private var opStack = [Op]()
    
   private var knownOps = [String:Op]()
    
    init() {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["-"] = Op.BinaryOperation("-") { $1 - $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
   private func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
   private func performOperation(symbol: String) {
    if let operation = knownOps[symbol] {
        opStack.append(operation)
    }
    }
}