//
//  APIService.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 21/10/2023.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func fetchArray(url: URL) -> AnyPublisher<[TubeLineModel], Error>
}

class APIService: APIServiceProtocol {
    func fetchArray(url: URL) -> AnyPublisher<[TubeLineModel], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .mapError{ error -> NetworkError in
                switch error{
                case is URLError:
                    return NetworkError.invalidURL
                case NetworkError.dataNotFound:
                    return NetworkError.dataNotFound
                case is DecodingError:
                    return NetworkError.parsingError
                default:
                    return NetworkError.dataNotFound
                }
            }
            .decode(type: [TubeLineModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
