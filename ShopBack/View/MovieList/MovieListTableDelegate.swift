//
//  MovieListTableDelegate.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import UIKit

class MovieListTableDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel: MovieListViewModelProtocol
    
    init(_ vm: MovieListViewModelProtocol) {
        self.viewModel = vm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDatas()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieInfoTableViewCell
        cell.config(viewModel.data(at: indexPath.row))
        if viewModel.isLoadNextPageIndex(indexPath.row) {
            viewModel.loadNextPage()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.select(at: indexPath.row)
    }
    
}
