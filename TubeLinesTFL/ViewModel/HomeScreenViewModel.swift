//
//  HomeScreenViewModel.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 20/10/2023.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    var apiService: APIServiceProtocol
    var cancellables = Set<AnyCancellable>()
    @Published var tubeLines: [TubeLineModel] = []
    @Published var customError: NetworkError?
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
        apiCall()
    }
    
    func apiCall() {
        
        guard let url = URL(string: APIendpoints.getTubeLineEndpoint()) else {
            self.customError = NetworkError.invalidURL
            return
        }
        
        apiService.fetchArray(url: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .sink { completion in
                switch completion{
                case .failure(let error):
                    switch error {
                    case is URLError:
                        self.customError = NetworkError.invalidURL
                    case NetworkError.dataNotFound:
                        self.customError = NetworkError.dataNotFound
                    case NetworkError.parsingError:
                        self.customError = NetworkError.parsingError
                    default:
                        self.customError = NetworkError.dataNotFound
                    }
                case .finished:
                    print("COMPLETION: \(completion)")
                }
            } receiveValue: { [weak self] tubeLinesArray in
                self?.tubeLines = tubeLinesArray
            }
            .store(in: &cancellables)

    }
}
