//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

@testable import CountOnMe

class SimpleCalcTests: XCTestCase {

    var simpleCalc: SimpleCalc!
        
        override func setUp() {
            super.setUp()
            simpleCalc = SimpleCalc()
        }

        override func tearDown() {
            simpleCalc = nil
            super.tearDown()
        }

    // Test addition method
        func testAddition() {
            // Given
            let calculator = SimpleCalc()
            
            // When
            let result = calculator.addition(elements: ["5", "+", "3"])
            
            // Then
            XCTAssertEqual(result, 8, "Addition operation failed")
        }
        
        // Test substraction method
        func testSubstraction() {
            // Given
            let calculator = SimpleCalc()
            
            // When
            let result = calculator.substraction(elements: ["8", "-", "3"])
            
            // Then
            XCTAssertEqual(result, 5, "Substraction operation failed")
        }
        
        // Test multiplication method
        func testMultiplication() {
            // Given
            let calculator = SimpleCalc()
            
            // When
            let result = calculator.multiplication(elements: ["4", "*", "3"])
            
            // Then
            XCTAssertEqual(result, 12, "Multiplication operation failed")
        }
        
        // Test division method
        func testDivision() {
            // Given
            let calculator = SimpleCalc()
            
            // When
            let result = calculator.division(elements: ["6", "/", "2"])
            
            // Then
            XCTAssertEqual(result, 3, "Division operation failed")
        }
        
        // Test calculateResult method
        func testCalculateResult() {
            // Given
            let calculator = SimpleCalc()
            calculator.elements = ["5", "+", "3"]
            
            // When
            let result = calculator.calculateResult()
            
            // Then
            XCTAssertEqual(result, "8", "Calculate result failed")
        }
        
        // Test case for expressionIsCorrect property
        func testExpressionIsCorrect() {
            // Given
            let calculator = SimpleCalc()
            calculator.elements = ["5", "+", "3"]
            
            // When
            let isCorrect = calculator.expressionIsCorrect
            
            // Then
            XCTAssertTrue(isCorrect, "Expression is incorrect")
        }
        
        // Test case for expressionHaveEnoughElement property
        func testExpressionHaveEnoughElement() {
            // Given
            let calculator = SimpleCalc()
            calculator.elements = ["5", "+", "3"]
            
            // When
            let haveEnoughElement = calculator.expressionHaveEnoughElement
            
            // Then
            XCTAssertTrue(haveEnoughElement, "Expression does not have enough elements")
        }
        
        // Test case for canAddOperator property
        func testCanAddOperator() {
            // Given
            let calculator = SimpleCalc()
            calculator.elements = ["5", "+", "3"]
            
            // When
            let canAddOperator = calculator.canAddOperator
            
            // Then
            XCTAssertFalse(canAddOperator, "Operator can be added incorrectly")
        }
        
        // Test case for expressionHaveResult property
        func testExpressionHaveResult() {
            // Given
            let calculator = SimpleCalc()
            calculator.elements = ["5", "+", "3", "="]
            
            // When
            let haveResult = calculator.expressionHaveResult
            
            // Then
            XCTAssertTrue(haveResult, "Expression does not have result")
        }
        
        // Test case for divisionByZero property
        func testDivisionByZero() {
            // Given
            let calculator = SimpleCalc()
            calculator.elements = ["5", "/", "0"]
            
            // When
            let divisionByZero = calculator.divisionByZero
            
            // Then
            XCTAssertTrue(divisionByZero, "Division by zero not detected")
        }
        
        // Add more test cases as needed
        
        // ...

    }
