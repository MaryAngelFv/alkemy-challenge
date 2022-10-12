//
//  DetailMovieViewModel.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import Foundation

class DetailMovieViewModel: NSObject {
    
    private var detailMovieService: DetailMovieServiceProtocol
    var reloadTableView: (() -> Void)?
    var detailMovie: DetailMovie? {
        didSet {
            reloadTableView?()
        }
    }
    
    var isDetailMovieValid: Bool {
        return detailMovie != nil
    }
    
    init(detailMovieService: DetailMovieServiceProtocol = DetailMovieService()) {
        self.detailMovieService = detailMovieService
    }
    
    func getDetailMovie(with id: Int?) {
        guard let id = id else { return }
        detailMovieService.getDetailMovie(id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let detailMovie):
                self.detailMovie = detailMovie
            case .failure(let error):
                print(error)
            }
        }
    }
}
