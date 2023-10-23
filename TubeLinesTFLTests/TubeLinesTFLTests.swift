//
//  TubeLinesTFLTests.swift
//  TubeLinesTFLTests
//
//  Created by Mauro Arantes on 20/10/2023.
//

import XCTest
import Combine
@testable import TubeLinesTFL

class TubeLinesTFLTests: XCTestCase {
    
    var sut: HomeScreenViewModel?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testApiCall_isSuccess() {
        //given
        sut = HomeScreenViewModel(apiService: MockAPIService(fileName: "MockResponse"))
        //when
        sut?.apiCall()
        //then
        let tubeLineModel = sut?.tubeLines.first
        XCTAssertEqual(sut?.tubeLines.count, 11)
        XCTAssertEqual(tubeLineModel?.name, "Bakerloo")
        XCTAssertEqual(tubeLineModel?.lineStatuses.first?.statusSeverityDescription, "Good Service")
    }
    
    func testApiCall_isFailure() {
        //given
        sut = HomeScreenViewModel(apiService: MockAPIService(fileName: "Error"))
        //when
        sut?.apiCall()
        //then
        XCTAssertEqual(sut?.tubeLines.count, 0)
    }

}
