//
//  Movie.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 11/10/22.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let posterPath: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case name = "original_title"
    }
}
