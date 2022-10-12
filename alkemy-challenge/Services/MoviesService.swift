//
//  MoviesService.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 11/10/22.
//

import Foundation

protocol MoviesServiceProtocol {
    func getPopularMovies(completion: @escaping (Result<[Movie], CustomError>) -> Void)
}

class MoviesService: MoviesServiceProtocol {
    private let serviceManager: BaseService
    
    init(serviceManager: BaseService = ServiceManager()) {
        self.serviceManager = serviceManager
    }
    
    func getPopularMovies(completion: @escaping (Result<[Movie], CustomError>) -> Void) {
        let params: [String: String] = [
            "api_key": NetworkConstants.apiKey,
            "language": "en",
            "page": "1"
        ]
        serviceManager.sendRequest(
            endpoint: .popular,
            queryParams: params,
            of: PopularMovies.self) { response in
                switch response {
                case .success(let popularMovies):
                    completion(.success(popularMovies.movies))
                case .failure(let customError):
                    completion(.failure(customError))
                }
            }
    }
}
