//
//  ZipCarObjcSwiftTests.swift
//  ZipCarObjCSwift
//
//  Created by Thomas Thompson on 8/9/15.
//  Copyright (c) 2015 Thomas Thompson. All rights reserved.
//

import UIKit
import XCTest
import ZipCarObjCSwift

class ZipCarObjcSwiftTests: XCTestCase {

    let validStrings = ["MMMM", "mmcdlxxiv", "CCC", "XXX", "III", "CM", "CD", "DCCC", "DCC", "DC", "XC", "XL", "LX", "LXX", "LXXX", "XV", "XIV", "XVI", "XVII", "XVIII", "IX", "XI", "XII", "XIII", "VI"]
    let validValues = [4000, 2474, 300, 30, 3, 900, 400, 800, 700, 600, 90, 40, 60, 70, 80, 15, 14, 16, 17, 18, 9, 11, 12, 13, 6]
    let invalidStrings = ["KJH", "CCCC", "XXXX", "IIII", "CMM", "CCM", "CCD", "DD", "XCC", "XXC", "XLL", "XXL", "IIV", "VVI"]
    let emptyString = ""

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testValidRomanNumeral() {
        for str in validStrings {
            let numeral = RomanNumeral(string: str)
            let errorMsg = str + " is a valid roman numeral but the method validRomanNumeral: is returning false."
            XCTAssert(numeral.validRomanNumeral(), "Failed.  " + errorMsg)
        }
    }
    
    func testInvalidRomanNumeral() {
        for str in invalidStrings {
            let numeral = RomanNumeral(string: str)
            let errorMsg = str + " is an invalid roman numeral but the method validRomanNumeral: is returning true."
            XCTAssertFalse(numeral.validRomanNumeral(), "Failed.  " + errorMsg)
        }
    }
    func testIsRomanNumeralCreatedFromAnEmptyStringValid() {
            let numeral = RomanNumeral(string: emptyString)
            let errorMsg = "A roman numeral created from an empty string is an invalid roman numeral but the method validRomanNumeral: is returning true."
            XCTAssertFalse(numeral.validRomanNumeral(), "Failed.  " + errorMsg)
    }
    
    func testNumericValueForInvalidNumerals(){
        for str in invalidStrings{
            let numeral = RomanNumeral(string:str)
            let errorMsg = str + "is a invalid roman numeral and it's numericValue should be \(NSIntegerMax) but it's numericValue property is \(numeral.numericValue())."
            XCTAssertEqual(numeral.numericValue(),NSIntegerMax,"Failed.  " + errorMsg)
        }
    }
    func testNumericValueForValidNumerals() {
        var i = 0
        for str in validStrings{
            let numeral = RomanNumeral(string:str)
            let errorMsg = str + " is a valid roman numeral and it's numeric value should be \(validValues[i]) but it's numericValue() is \(numeral.numericValue())"
            XCTAssertEqual(numeral.numericValue(), validValues[i], "Failed.  " + errorMsg)
            i++
        }
    }
    func testNumericValueForEmpyStringRomanNumeral(){
        let numeral = RomanNumeral(string: emptyString)
        let errorMsg = "A roman numeral created from an empty string should have a numeric value of zero but it's numericValue() is \(numeral.numericValue())"
        XCTAssertEqual(numeral.numericValue(), 0, "Failed.  " + errorMsg)

    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
}



  