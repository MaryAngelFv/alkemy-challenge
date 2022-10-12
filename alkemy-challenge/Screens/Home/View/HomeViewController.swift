//
//  HomeViewController.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 10/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    
    private var viewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColor()
        initView()
        initViewModel()
    }
    
    func initView() {
        view.backgroundColor = .black
        title = viewModel.title
        let customLayout = CollectionViewHorizontalCustom()
        customLayout.height = 200
        moviesCollectionView.collectionViewLayout = customLayout
        moviesCollectionView.backgroundColor = .black
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        moviesCollectionView.register(
            PopularMovieCollectionViewCell.nib,
            forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier
        )
    }
    
    func initViewModel() {
        viewModel.reloadCollectionView = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
            }
        }
        viewModel.didGetError = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.moviesCollectionView.setErrorMessage(self.viewModel.messageError)
            }
        }
        viewModel.getPopularMovies()
    }
}

// MARK: - UICollectionViewDataSource -
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as? PopularMovieCollectionViewCell,
              let model = viewModel.getModel(at: indexPath)
        else {
            return UICollectionViewCell()
        }
        cell.model = model
        return cell
    }
}

// MARK: - UICollectionViewDelegate -
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navigationController = navigationController,
              let movieSelected = viewModel.getModel(at: indexPath)
        else { return }
        
        let detailMovieViewController = DetailMovieViewController()
        detailMovieViewController.idMovie = movieSelected.id
        navigationController.pushViewController(detailMovieViewController, animated: false)
    }
}
