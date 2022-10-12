//
//  Endpoint.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 11/10/22.
//

import Foundation

enum CustomError: Error {
    case badUrl
    case responseError
    case noInternetConnection
}

enum NetworkConstants {
    static let baseUrl: String = "https://api.themoviedb.org/3/"
    static let apiKey: String = "018e3d7918ea64b40c2ab8be36791a76"
    static let baseImageUrl: String = "https://image.tmdb.org/t/p/w500"
}

enum Endpoint {
    case popular
    case detail(id: Int)
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case let .detail(id):
            return "movie/\(id)"
        }
    }
}
