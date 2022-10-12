//
//  MoviesViewModel.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 11/10/22.
//

import Foundation

enum HomeStrings {
    static let title = "Movies"
}

class MoviesViewModel: NSObject {
    private var moviesService: MoviesServiceProtocol
    var reloadCollectionView: (() -> Void)?
    var didGetError: (() -> Void)?
    var title: String { return HomeStrings.title }
    var movieList = [Movie]() {
        didSet {
            reloadCollectionView?()
        }
    }
    var messageError: String? {
        didSet {
            didGetError?()
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
                self.movieList = []
                if error == .noInternetConnection {
                    self.messageError = ErrorStrings.noInternetMessage
                } else {
                    self.messageError = ErrorStrings.defaultMessage
                }
            }
        }
    }
    
    func getModel(at indexPath: IndexPath) -> Movie? {
        guard indexPath.row < movieList.count else { return nil }
        return movieList[indexPath.row]
    }
}
