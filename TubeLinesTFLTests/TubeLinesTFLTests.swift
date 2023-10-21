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
        XCTAssertEqual(sut?.tubeLines.count, 11)
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

class MockAPIService: APIServiceProtocol {
    
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func fetchArray(url: URL) -> AnyPublisher<[TubeLineModel], Error> {
        if let path = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([TubeLineModel].self, from: data)
                return Just(jsonData)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } catch {
                print("error:\(error)")
            }
        }
        let result: [TubeLineModel] = []
        return Just(result)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
