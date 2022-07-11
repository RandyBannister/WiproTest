//
//  WiproTestTests.swift
//  WiproTestTests
//
//  Created by RandyKBannister on 7/11/22.
//

import XCTest
@testable import WiproTest

class WiproTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let helper = InputConfirmHelper()
        let emailResult1 = helper.checkEmail(email: "aa")
        let emailResult2 = helper.checkEmail(email: "aa@aa.com")
        XCTAssertTrue(emailResult1)
        XCTAssertTrue(emailResult2)
        
        let passwordResult1 = helper.passwordCheck(pwd: "a")
        let passwordResult2 = helper.passwordCheck(pwd: "aA")
        let passwordResult3 = helper.passwordCheck(pwd: "aA!")
        let passwordResult4 = helper.passwordCheck(pwd: "A@#22")
        let passwordResult5 = helper.passwordCheck(pwd: "ASD@aa221#$")

        XCTAssertEqual(passwordResult1, .upper)
        XCTAssertEqual(passwordResult2, .special)
        XCTAssertEqual(passwordResult3, .numbers)
        XCTAssertEqual(passwordResult4, .sixCharacters)
        XCTAssertEqual(passwordResult5, .right)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
