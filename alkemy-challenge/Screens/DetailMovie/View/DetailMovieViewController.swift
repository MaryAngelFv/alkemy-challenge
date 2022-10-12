//
//  DetailMovieViewController.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import UIKit

class DetailMovieViewController: UIViewController {

    private var sections: [DetailMovieSections] = []
    private let viewModel: DetailMovieViewModel = DetailMovieViewModel()
    var idMovie: Int?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.register(DetailImageTableViewCell.self, forCellReuseIdentifier: DetailImageTableViewCell.identifier)
        tableView.register(DetailInfoTableViewCell.self, forCellReuseIdentifier: DetailInfoTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        initViewModel()
    }
    
    private func configureView() {
        setNavigationBarColor()
        view.addSubview(tableView)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func initViewModel() {
        viewModel.getDetailMovie(with: idMovie)
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            self.getSections()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func getSections() {
        sections.append(.title)
        sections.append(.image)
        guard let detailMovie = viewModel.detailMovie else { return }
        if let summary = detailMovie.summary,
           !summary.isEmpty {
            sections.append(.summary)
        }
        if !detailMovie.releaseDate.isEmpty {
            sections.append(.releaseDate)
        }
        if !detailMovie.status.isEmpty {
            sections.append(.status)
        }
    }
}

// MARK: - UITableViewDataSource -
extension DetailMovieViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.isDetailMovieValid ? sections.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.isDetailMovieValid ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailMovie = viewModel.detailMovie,
              indexPath.section < sections.count
        else {
            return UITableViewCell()
        }
        let section = sections[indexPath.section]
        
        switch section {
        case .image:
            let model = DetailImageCellModel(posterPath: detailMovie.image ?? "")
            return getImageCell(model, indexPath)
        case .summary:
            let model = DetailInfoCellModel(title: section.titleHeader, information: detailMovie.summary ?? "")
            return getInfoCell(model, indexPath)
        case .releaseDate:
            let model = DetailInfoCellModel(title: section.titleHeader, information: detailMovie.releaseDate)
            return getInfoCell(model, indexPath)
        case .status:
            let model = DetailInfoCellModel(title: section.titleHeader, information: detailMovie.status)
            return getInfoCell(model, indexPath)
        case .title:
            let model = DetailInfoCellModel(title: detailMovie.title, information: "")
            return getInfoCell(model, indexPath)
        }
    }
    
    private func getImageCell(_ model: DetailImageCellModel, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailImageTableViewCell.identifier, for: indexPath) as? DetailImageTableViewCell
        else {
            return UITableViewCell()
        }
        cell.model = model
        return cell
    }
    
    private func getInfoCell(_ model: DetailInfoCellModel, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoTableViewCell.identifier, for: indexPath) as? DetailInfoTableViewCell
        else {
            return UITableViewCell()
        }
        cell.model = model
        return cell
    }
}
