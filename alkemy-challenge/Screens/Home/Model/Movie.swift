//
//  Movie.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 11/10/22.
//

import Foundation

enum MovieCategory: Int, Codable, CaseIterable {
    case all
    case popular
    case topRated
    case upcoming
}

struct Movie: Codable {
    let id: Int
    let posterPath: String?
    let name: String
    let category: MovieCategory?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case name = "original_title"
        case category
    }
}