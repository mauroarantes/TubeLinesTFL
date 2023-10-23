//
//  MockAPIService.swift
//  TubeLinesTFLTests
//
//  Created by Mauro Arantes on 23/10/2023.
//

import Foundation
import Combine
@testable import TubeLinesTFL

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
                return Fail(error: NetworkError.dataNotFound)
                    .eraseToAnyPublisher()
            }
        }
        return Fail(error: NSError())
            .eraseToAnyPublisher()
    }
}
