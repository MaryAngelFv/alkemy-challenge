//
//  MoviesViewModel.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 11/10/22.
//

import Foundation

enum HomeStrings {
    static let title = "Movies"
}

class MoviesViewModel: NSObject {
    private var moviesService: MoviesServiceProtocol
    var reloadTableView: (() -> Void)?
    var title: String { return HomeStrings.title }
    var movieList = [Movie]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(moviesService: MoviesServiceProtocol = MoviesService()) {
        self.moviesService = moviesService
    }
    
    func getPopularMovies() {
        moviesService.getPopularMovies { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let movies):
                self.movieList = movies
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getModel(at indexPath: IndexPath) -> Movie {
        return movieList[indexPath.row]
    }
}
