//
//  HomeScreenViewModel.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 20/10/2023.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    @Published var tubeLines: [TubeLineModel] = []
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        
        guard let url = URL(string: APIendpoints.getTubeLineEndpoint()) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [TubeLineModel].self, decoder: JSONDecoder())
            .sink { completion in
                print("COMPLETION: \(completion)")
            } receiveValue: { [weak self] tubeLinesArray in
                self?.tubeLines = tubeLinesArray
            }
            .store(in: &cancellables)

    }
}
