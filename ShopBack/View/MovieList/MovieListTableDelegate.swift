//
//  MovieListTableDelegate.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import UIKit

class MovieListTableDelegate: NSObject, UITableViewDataSource {
    
    private let viewModel: MovieListViewModelProtocol
    
    init(_ vm: MovieListViewModelProtocol) {
        self.viewModel = vm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDatas()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieInfoTableViewCell
        let data = viewModel.data(at: indexPath.row)
        
        return cell
    }
    
}
