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
    
    func calculateResult(elements: [String]) -> String {
            var mutableElements = elements

            // Ensure there are enough elements to perform operations
            guard expressionHaveEnoughElement else {
                fatalError("Not enough elements to perform operations!")
            }

            // Check if all operators are the same (either '+' or '-')
            let allOperatorsSame = Set(mutableElements.filter { $0 == "+" || $0 == "-" }).count == 1

            if allOperatorsSame {
                calculateSequentially(&mutableElements)
            } else {
                multiplyOrDivide(&mutableElements)
                addOrSubtract(&mutableElements)
            }

            guard let finalResult = mutableElements.first else {
                fatalError("Error calculating the final result!")
            }

            return finalResult
        }

        private func calculateSequentially(_ elements: inout [String]) {
            while elements.count > 1 {
                let leftOperand = Int(elements[0])!
                let operatorSymbol = elements[1]
                let rightOperand = Int(elements[2])!

                let result: Int
                if operatorSymbol == "+" {
                    result = leftOperand + rightOperand
                } else {
                    // Check for subtraction with negative result
                    result = leftOperand - rightOperand
                }

                // Replace operands and operator with the result
                elements.removeFirst(3)
                elements.insert("\(result)", at: 0)
            }
        }

        private func multiplyOrDivide(_ elements: inout [String]) {
            while elements.contains("*") || elements.contains("/") {
                if let index = elements.firstIndex(where: { $0 == "*" || $0 == "/" }) {
                    let operatorPosition = index
                    let leftOperandIndex = operatorPosition - 1
                    let rightOperandIndex = operatorPosition + 1

                    guard leftOperandIndex >= 0 && rightOperandIndex < elements.count else {
                        fatalError("Invalid operands for multiplication or division!")
                    }

                    let leftOperand = Int(elements[leftOperandIndex])!
                    let rightOperand = Int(elements[rightOperandIndex])!

                    let result: Int
                    if elements[operatorPosition] == "*" {
                        result = leftOperand * rightOperand
                    } else {
                        // Check for division by zero
                        guard rightOperand != 0 else {
                            fatalError("Division by zero is not allowed!")
                        }
                        result = leftOperand / rightOperand
                    }

                    // Replace operands and operator with the result
                    elements.remove(at: rightOperandIndex)
                    elements.remove(at: operatorPosition)
                    elements[leftOperandIndex] = "\(result)"
                }
            }
        }

        private func addOrSubtract(_ elements: inout [String]) {
            while elements.count > 1 {
                let leftOperand = Int(elements[0])!
                let operatorSymbol = elements[1]
                let rightOperand = Int(elements[2])!

                let result: Int
                if operatorSymbol == "+" {
                    result = leftOperand + rightOperand
                } else {
                    // Check for subtraction with negative result
                    result = leftOperand - rightOperand
                }

                // Replace operands and operator with the result
                elements.removeFirst(3)
                elements.insert("\(result)", at: 0)
            }
        }
}
