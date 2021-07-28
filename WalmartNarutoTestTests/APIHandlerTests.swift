//
//  APIHandlerTests.swift
//  WalmartNarutoTestTests
//
//  Created by Igor Chernobai on 7/27/21.
//

import XCTest
@testable import WalmartNarutoTest

class APIHandlerTests: XCTestCase {

    var sut = APIHandler.shared

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {

    }


    func testRequestData() {
        let expectation = expectation(description: "gotData")
        sut.requestData(endPoint: .search, params: [.q: "naruto"]) { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

}
