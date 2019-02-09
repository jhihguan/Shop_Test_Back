//
//  MovieListViewController.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: MovieInfoTableViewCell.self)
        }
    }
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            tableViewDelegate = MovieListTableDelegate(viewModel)
        }
    }
    private var tableViewDelegate: MovieListTableDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull Refresh")
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
        viewModel = MovieListViewModel(api: TmdbAPIProvider())
        viewModel.reloadAction = { [weak self] in
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
            self?.tableView.reloadData()
        }
        viewModel.errorAction = { error in
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
            print(error)
        }
        viewModel.selectAction = { [weak self] vm in
            let detail = MovieDetailViewController.storyboardViewController()
            detail.viewModel = vm
            self?.navigationController?.pushViewController(detail, animated: true)
        }
        tableView.addSubview(refreshControl)
        tableView.dataSource = tableViewDelegate
        tableView.delegate = tableViewDelegate
        viewModel.loadNextPage()
    }

    @objc func pullToRefreshAction() {
        viewModel.reloadAll()
    }

}

