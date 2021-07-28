//
//  WalmartNarutoTestTests.swift
//  WalmartNarutoTestTests
//
//  Created by Igor Chernobai on 7/27/21.
//

import XCTest
@testable import WalmartNarutoTest

class WalmartNarutoTestTests: XCTestCase {

    var sut: MainViewModel?


    override func setUpWithError() throws {

        sut = MainViewModel(searchRequestText: Constants.BaseURL.rawValue)

    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCheckViewModel() throws {
        XCTAssertNotNil(sut, "❌ viewModel should not be nil")
    }

    func testFetchMethod() throws {
        sut?.fetchData(endPoint: .search, completion: { result in
            XCTAssertNotNil(self.sut?.animesObject, "❌ getDataFromUrl should be working")
        })

        sut?.fetchData(endPoint: .search, completion: { result in
            XCTAssertNil(self.sut?.animesObject, "❌ getDataFromUrl should be working")
        })
    }

    func testFetchData() {
        let expectation = expectation(description: "gotAnimes")
        sut?.fetchData(endPoint: .search) { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testCountAnimesCount() throws {
        guard let sut = sut else {return}
        let expectation = expectation(description: "gotAnimes")
        sut.fetchData(endPoint: .search) { result in
            XCTAssertTrue(sut.getAnimesCount() > 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testAnimeForCell() throws {
        guard let sut = sut else {return}
        let expectation = expectation(description: "gotAnimes")
        sut.fetchData(endPoint: .search) { result in
            XCTAssertNotNil(sut.getAnimeForCell(at: 0))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
}
