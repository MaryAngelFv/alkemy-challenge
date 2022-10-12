//
//  MockMoviesService.swift
//  alkemy-challengeTests
//
//  Created by Angelica Ferreira on 12/10/22.
//

import Foundation
@testable import alkemy_challenge

struct MoviesServiceCalls {
    var didGetData: Bool = false
    var didGetError: Bool = false
}

class MockMoviesService: MoviesServiceProtocol {
    lazy var calls = MoviesServiceCalls()
    var errorServices = false
    
    func getPopularMovies(completion: @escaping (Result<[Movie], CustomError>) -> Void) {
        guard let popularMovies = generatePopularMoviesResponse(),
              !errorServices
        else {
            calls.didGetError = true
            completion(.failure(.responseError))
            return
        }
        calls.didGetData = true
        completion(.success(popularMovies.movies))
    }
    
    private func generatePopularMoviesResponse() -> PopularMovies? {
        let bundle = Bundle(for: MockMoviesService.self)
        guard let model: PopularMovies = FileManager.getJSONObject(from: "PopularMovies", bundle: bundle) else { return nil }
        return model
    }
}
