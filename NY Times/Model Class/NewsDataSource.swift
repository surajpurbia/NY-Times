//
//  NewsDataSource.swift
//  NY Times
//
//  Created by Suraj Purbia on 19/11/18.
//  Copyright © 2018 Suraj Purbia. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class NewsDataSource : GenericDataSource<ArticleCellViewModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell configuration
        let cell = tableView.dequeueReusableCell(withIdentifier: kArticleCellID, for: indexPath) as! NyNewsTableViewCell
        cell.selectionStyle = .none
        cell.configCellUI()
        
        // Set cell data
        let articleCellVM = self.data.value[indexPath.row]
        cell.articleCellVM = articleCellVM
        return cell
    }
}

