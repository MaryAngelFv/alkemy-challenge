//
//  MockDetailMovieService.swift
//  alkemy-challengeTests
//
//  Created by Angelica Ferreira on 12/10/22.
//

import Foundation
@testable import alkemy_challenge

struct DetailServiceCalls {
    var didGetData: Bool = false
    var didGetError: Bool = false
}

class MockDetailMovieService: DetailMovieServiceProtocol {
    lazy var calls = DetailServiceCalls()
    var errorServices = false
    
    func getDetailMovie(_ idMovie: Int, completion: @escaping (Result<DetailMovie, CustomError>) -> Void) {
        guard let detailMovie = generateDetailMovieResponse(),
              !errorServices
        else {
            calls.didGetError = true
            completion(.failure(.responseError))
            return
        }
        calls.didGetData = true
        completion(.success(detailMovie))
    }
    
    private func generateDetailMovieResponse() -> DetailMovie? {
        let bundle = Bundle(for: MockDetailMovieService.self)
        guard let model: DetailMovie = FileManager.getJSONObject(from: "DetailMovie", bundle: bundle) else { return nil }
        return model
    }
}
