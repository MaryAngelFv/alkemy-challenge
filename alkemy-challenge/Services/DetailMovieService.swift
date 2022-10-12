//
//  DetailMovieService.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import Foundation

protocol DetailMovieServiceProtocol {
    func getDetailMovie(_ idMovie: Int, completion: @escaping (Result<DetailMovie, CustomError>) -> Void)
}

class DetailMovieService: DetailMovieServiceProtocol {
    
    private let serviceManager: BaseService
    
    init(serviceManager: BaseService = ServiceManager()) {
        self.serviceManager = serviceManager
    }
    
    func getDetailMovie(_ idMovie: Int, completion: @escaping (Result<DetailMovie, CustomError>) -> Void) {
        let params = [
            "api_key": NetworkConstants.apiKey,
            "language": "en",
            "page": "1"
        ]
        serviceManager.sendRequest(
            endpoint: .detail(id: idMovie),
            queryParams: params,
            of: DetailMovie.self,
            completion: completion
        )
    }
}
