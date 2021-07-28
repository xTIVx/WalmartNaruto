//
//  APIHandlerTests.swift
//  WalmartNarutoTestTests
//
//  Created by Igor Chernobai on 7/27/21.
//

import XCTest
@testable import WalmartNarutoTest

class APIHandlerTests: XCTestCase {

    var sut: APIHandler?

    override func setUpWithError() throws {
        sut = APIHandler.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }


    func testRequestData() {
        let expectation = expectation(description: "gotData")
        sut?.requestData(type: EpisodeResult.self, endPoint: .search, params: [.q: "naruto"]) { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

}
