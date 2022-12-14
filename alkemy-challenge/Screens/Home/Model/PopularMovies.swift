//
//  PopularMovies.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 11/10/22.
//

import Foundation

struct PopularMovies: Codable {
    let page: Int
    let movies: [Movie]
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case movies = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
