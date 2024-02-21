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

    // Test calculateExpression method for simple addition with decimal numbers
    func testCalculateExpressionSimpleAdditionDecimal() {
        // Given
        simpleCalc.elements = ["5.5", "+", "3.3"]

        // When
        let result = simpleCalc.calculateExpression(from: simpleCalc.elements)

        // Then
        XCTAssertEqual(result!, 8.8, accuracy: 0.001, "Calculate expression failed for simple addition with decimal numbers")
    }

    // Test calculateExpression method for complex expression with decimal numbers
    func testCalculateExpressionComplexExpressionDecimal() {
        // Given
        simpleCalc.elements = ["5.5", "+", "3.3", "*", "2", "/", "2.5", "-", "1"]

        // When
        let result = simpleCalc.calculateExpression(from: simpleCalc.elements)

        // Then
        XCTAssertEqual(result!, 7.14, accuracy: 0.001, "Calculate expression failed for complex expression with decimal numbers")
    }

    // Test calculateExpression method for simple addition only
    func testCalculateExpressionAdditionOnly() {
        // Given
        simpleCalc.elements = ["5", "+", "3", "+", "2", "+", "1"]

        // When
        let result = simpleCalc.calculateExpression(from: simpleCalc.elements)

        // Then
        XCTAssertEqual(result, 11, "Calculate expression failed for addition only")
    }

    // Test calculateExpression method for subtraction only
    func testCalculateExpressionSubtractionOnly() {
        // Given
        simpleCalc.elements = ["10", "-", "3", "-", "2", "-", "1"]

        // When
        let result = simpleCalc.calculateExpression(from: simpleCalc.elements)

        // Then
        XCTAssertEqual(result, 4, "Calculate expression failed for subtraction only")
    }

    // Test calculateExpression method for complex expression
    func testCalculateExpressionComplexExpression() {
        // Given
        simpleCalc.elements = ["5", "+", "3", "*", "2", "/", "2", "-", "1"]

        // When
        let result = simpleCalc.calculateExpression(from: simpleCalc.elements)

        // Then
        XCTAssertEqual(result, 7.00, "Calculate expression failed for complex expression")
    }

    // Test case for expressionIsCorrect property with a correct expression
    func testExpressionIsCorrect() {
        // Given
        simpleCalc.elements = ["5", "+", "3"]

        // When
        let isCorrect = simpleCalc.expressionIsCorrect

        // Then
        XCTAssertTrue(isCorrect, "Expression is incorrect")
    }

    // Test case for expressionHaveEnoughElement property with enough elements
    func testExpressionHaveEnoughElement() {
        // Given
        simpleCalc.elements = ["5", "+", "3", "*", "2", "/", "2", "-", "1"]

        // When
        let haveEnoughElement = simpleCalc.expressionHaveEnoughElement

        // Then
        XCTAssertTrue(haveEnoughElement, "Expression does not have enough elements")
    }

    // Test case for canAddOperator property with the possibility to add an operator
    func testCanAddOperator() {
        // Given
        simpleCalc.elements = ["5", "+", "3"]

        // When
        let canAddOperator = simpleCalc.canAddOperator

        // Then
        XCTAssertTrue(canAddOperator, "Operator can be added incorrectly")
    }

    // Test case for expressionHaveResult property with a result in the expression
    func testExpressionHaveResult() {
        // Given
        simpleCalc.elements = ["5", "+", "3", "="]

        // When
        let haveResult = simpleCalc.expressionHaveResult

        // Then
        XCTAssertTrue(haveResult, "Expression does not have result")
    }

    // Test case for divisionByZero property with division by zero detected
    func testDivisionByZero() {
        // Given
        simpleCalc.elements = ["5", "/", "0"]

        // When
        let divisionByZero = simpleCalc.divisionByZero

        // Then
        XCTAssertTrue(divisionByZero, "Division by zero not detected")
    }
}
