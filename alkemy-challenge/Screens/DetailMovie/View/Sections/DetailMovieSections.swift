//
//  DetailMovieSections.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import Foundation

enum DetailMovieSections: CaseIterable {
    case summary
    case image
    case releaseDate
    case status
    case title
    
    var titleHeader: String {
        switch self {
        case .summary:
            return "Summary:"
        case .releaseDate:
            return "Release date"
        case .status:
            return "Status"
        default:
            return ""
        }
    }
}
