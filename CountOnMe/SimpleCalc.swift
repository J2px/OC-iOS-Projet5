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
    
    private func extractNumbers(from array: [String]) -> [String] {
        var result = [String]()
        var currentNumber = ""
        
        for element in array {
            if let _ = Double(element) { // Si l'élément est un nombre ou un nombre décimal
                currentNumber += element
            } else {
                // Vérifie si l'élément est un point décimal et que le nombre en cours n'est pas vide
                if element == "." && !currentNumber.isEmpty {
                    currentNumber += element // Ajoute le point décimal au nombre en cours
                } else {
                    if !currentNumber.isEmpty {
                        result.append(currentNumber)
                        currentNumber = ""
                    }
                    result.append(element)
                }
            }
        }
        
        if !currentNumber.isEmpty {
            result.append(currentNumber)
        }
        
        return result
        
    }
    
    
    func calculateExpression(from elements: [String]) -> Double? {
        let numbers = extractNumbers(from: elements)
        var result: Double = 0
        var currentOperator = "+"

        for element in numbers {
            if let number = Double(element) {
                switch currentOperator {
                case "+":
                    result += number
                case "-":
                    result -= number
                case "*":
                    result *= number
                case "/":
                    if number != 0 {
                        result /= number
                    } else {
                        return nil
                    }
                default:
                    break
                }
            } else {
                currentOperator = element
            }
        }

        return result
    }
}
