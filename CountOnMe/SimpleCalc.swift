//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Jimmy JERMIDI on 10/01/2024.
//  Copyright © 2024 Vincent Saluzzo. All rights reserved.
//

import Foundation

public class SimpleCalc {
    
    //var elements:String!
    
    
    
    var elements: [String] = [] {
        didSet {
            elements = elements.filter {
                $0.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            }
        }
    }
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" &&
        elements.last != "-" &&
        elements.last != "*" &&
        elements.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+"
        && elements.last != "-"
        && elements.last != "*"
        && elements.last != "/"
    }
    
    var expressionHaveResult: Bool {
        return elements.contains("=")
    }
    
    var divisionByZero: Bool {
        return elements.contains("/") && elements.last == "0"
    }
    
    
    /*func calculateExpression(from elements: String) -> Double? {
        //let elementsToConvert = elements.joined(separator: " ")
        let expression = NSExpression(format: elements)

        do {
            if let result = try expression.expressionValue(with: nil, context: nil) as? Double {
                print(result)
                return result
            } else {
                print("Expression result is not a Double")
                return nil
            }
        } catch {
            print("Error: \(error)")
            return nil
        }
    }*/
    
    
 
    private func extractNumbers(from elements: [String]) -> [Double] {
        var result: [Double] = []
        
        for element in elements {
            if let number = Double(element) {
                result.append(number)
            }
        }
        
        return result
    }
    
    
    func calculateExpression(from elements: [String]) -> Double? {
        var numbers = extractNumbers(from: elements)
        var operators: [String] = []

        // Extract operators
        for element in elements {
            if ["+", "-", "*", "/"].contains(element) {
                operators.append(element)
            }
        }

        // First, handle multiplication and division
        var index = 0
        while index < operators.count {
            let op = operators[index]
            if op == "*" || op == "/" {
                // Ensure we have enough operands
                if index < numbers.count - 1 {
                    let operand1 = numbers[index]
                    let operand2 = numbers[index + 1]
                    let result = performOperation(operator: op, operand1: operand1, operand2: operand2)
                    numbers[index] = result
                    numbers.remove(at: index + 1) // Remove the next number as it has been used in the operation
                    operators.remove(at: index)
                } else {
                    return nil
                }
            } else {
                index += 1
            }
        }

        // Then, handle addition and subtraction
        var result: Double? = numbers.first
        index = 0
        while index < operators.count {
            let op = operators[index]
            // Ensure we have enough operands
            if index < numbers.count - 1 {
                let operand = numbers[index + 1]
                result = performOperation(operator: op, operand1: result ?? 0, operand2: operand)
                index += 1
            } else {
                return nil
            }
        }

        return result
    }


    func performOperation(operator op: String, operand1: Double, operand2: Double) -> Double {
        switch op {
        case "+":
            return operand1 + operand2
        case "-":
            return operand1 - operand2
        case "*":
            return operand1 * operand2
        case "/":
            if operand2 != 0 {
                return operand1 / operand2
            } else {
                return Double.nan
            }
        default:
            return Double.nan
        }
    }
  
      
}
