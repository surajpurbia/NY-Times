//
//  ArticleCellViewModel.swift
//  NY Times
//
//  Created by Suraj Purbia on 19/11/18.
//  Copyright © 2018 Suraj Purbia. All rights reserved.
//

import Foundation

struct ArticleCellViewModel
{
    var title:String!
    var imageUrl:String?
    var publishedDate:Date!
    var byLineString:String?
    var captionInfo:String?
    
    init(article:Article)
    {
        self.title = article.name
        self.imageUrl = article.imageUrl
        self.publishedDate = article.publishedDate
        self.byLineString = article.byLineString
        self.captionInfo = article.abstractInfo
    }
}
