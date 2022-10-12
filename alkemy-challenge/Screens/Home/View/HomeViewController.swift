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
        moviesCollectionView.allowsSelection = false
        moviesCollectionView.register(
            PopularMovieCollectionViewCell.nib,
            forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier
        )
    }
    
    func initViewModel() {
        viewModel.getPopularMovies()
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource -
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as? PopularMovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.model = viewModel.getModel(at: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate -
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // route to detail view
    }
}
