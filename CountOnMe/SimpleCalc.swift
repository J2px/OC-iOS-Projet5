//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Jimmy JERMIDI on 10/01/2024.
//  Copyright © 2024 Vincent Saluzzo. All rights reserved.
//

import Foundation

public class SimpleCalc {

    var elements: [String] = [] {
        didSet {
            elements = elements.filter {
                $0.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            }
        }
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" &&
        elements.last != "-" &&
        elements.last != "*" &&
        elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+"
        && elements.last != "-"
        && elements.last != "*"
        && elements.last != "/"
    }

    var expressionHaveResult: Bool {
        elements.contains("=")
    }

    var divisionByZero: Bool {
        elements.contains("/") && elements.last == "0"
    }

    /*func calculateResult() -> String {
     var operationsToReduce = elements
     
     while operationsToReduce.count > 1 {
     let left = Int(operationsToReduce[0])!
     let operand = operationsToReduce[1]
     let right = Int(operationsToReduce[2])!
     
     let result: Int
     switch operand {
     case "+": result = left + right
     case "-": result = left - right
     case "*": result = left * right
     case "/": result = left / right
     default: fatalError("Unknown operator !")
     }
     
     operationsToReduce = Array(operationsToReduce.dropFirst(3))
     operationsToReduce.insert("\(result)", at: 0)
     }
     
     return operationsToReduce.first ?? ""
     }*/

    func addition(elements: [String]) -> Int {
        var result = 0
        if elements.count > 1 {
            let firstElement = Int(elements[0])!
            let nextElement = Int(elements[2])!
            result = firstElement + nextElement
        }

        return result
    }

    func substraction(elements: [String]) -> Int {
        var result=0
        if elements.count > 1 && elements.count == 3 {
            let firstElement = Int(elements[0])!
            let nextElement = Int(elements[2])!
            result = firstElement - nextElement
        } else {
            fatalError("ERROR!")
        }
        return result
    }

    func multiplication(elements: [String]) -> Int {
        var result=0
        if elements.count > 1 && elements.count == 3 {
            let firstElement = Int(elements[0])!
            let nextElement = Int(elements[2])!
            result = firstElement * nextElement
        } else {
            fatalError("ERROR!")
        }
        return result
    }

    func division(elements: [String]) -> Int {
        var result=0
        if elements.count > 1 {
            let firstElement = Int(elements[0])!
            let nextElement = Int(elements[2])!
            if nextElement > 0 {
                result = firstElement / nextElement
            } else {
                fatalError("ERROR!")
            }

        }

        return result
    }

    func calculateResult() -> String {
        var elementsForOperation = elements

        let operand = elementsForOperation[1]
        let result: Int
        switch operand {
        case "+": result = addition(elements: elements)
        case "-": result = substraction(elements: elements)
        case "*": result = multiplication(elements: elements)
        case "/": result = division(elements: elements)
        default: fatalError("Unknown operator !")
        }

        elementsForOperation = Array(elementsForOperation.dropFirst(3))
        elementsForOperation.insert("\(result)", at: 0)

        return elementsForOperation[0]
    }

}
