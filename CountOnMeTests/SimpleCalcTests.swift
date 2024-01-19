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

        // Test the calculateResult function
        func testCalculateResult() {
    
            simpleCalc.elements = ["2", "+", "3"]
            XCTAssertEqual(simpleCalc.calculateResult(), "5")

            simpleCalc.elements = ["5", "-", "2"]
            XCTAssertEqual(simpleCalc.calculateResult(), "3")

            simpleCalc.elements = ["4", "*", "3"]
            XCTAssertEqual(simpleCalc.calculateResult(), "12")

            simpleCalc.elements = ["6", "/", "2"]
            XCTAssertEqual(simpleCalc.calculateResult(), "3")
        }


        func testExpressionIsCorrect() {
            
            simpleCalc.elements = ["2", "+", "3"]
            XCTAssertTrue(simpleCalc.expressionIsCorrect)

            simpleCalc.elements = ["2", "+"]
            XCTAssertFalse(simpleCalc.expressionIsCorrect)
        }

        
        func testExpressionHaveEnoughElement() {
           
            simpleCalc.elements = ["2", "+", "3"]
            XCTAssertTrue(simpleCalc.expressionHaveEnoughElement)

            simpleCalc.elements = ["2", "+"]
            XCTAssertFalse(simpleCalc.expressionHaveEnoughElement)
        }

  
        func testCanAddOperator() {
         
            simpleCalc.elements = ["2", "+"]
            XCTAssertTrue(simpleCalc.canAddOperator)

            simpleCalc.elements = ["2", "+"]
            XCTAssertFalse(simpleCalc.canAddOperator)
        }

     
        func testExpressionHaveResult() {
    
            simpleCalc.elements = ["2", "+", "3", "=", "5"]
            XCTAssertTrue(simpleCalc.expressionHaveResult)

            simpleCalc.elements = ["2", "+"]
            XCTAssertFalse(simpleCalc.expressionHaveResult)
        }

}
