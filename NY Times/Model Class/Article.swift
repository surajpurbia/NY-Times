//
//  Article.swift
//  NY Times
//
//  Created by Suraj Purbia on 19/11/18.
//  Copyright © 2018 Suraj Purbia. All rights reserved.
//

import Foundation

struct NewsData {
    var articles: [Article]?
}

extension NewsData: JsonParsable {
    static func jsonparseObject(dictionary: [String : AnyObject]) -> Result<NewsData, ErrorResult> {
        if let results = dictionary["results"] as? [[String: Any]] {
            let articles = results.map({ Article(articleDict: $0)}).compactMap{$0}
            let meta = NewsData(articles: articles)
            return Result.success(meta)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
        }
    }
}

struct Article
{
    var name:String!
    var imageUrl:String?
    var publishedDate:Date!
    var byLineString:String?
    var abstractInfo:String?
    
    
    init?(articleDict:Dictionary<String,Any>)
    {
        guard let _ = articleDict["title"] as? String else {
            return nil
        }
        
        self.name = articleDict[kServerDataJSONKeyTitle] as? String
        self.byLineString = articleDict[kServerDataJSONKeyByLine] as? String
        self.abstractInfo = articleDict[kServerDataJSONKeyAbstract] as? String
        
        if let dateString = articleDict[kServerDataJSONKeyPublishedDate] as? String {
            self.publishedDate = AppUtility.getDateFromString(dateString: dateString)! as Date
        }
        
        if let media = articleDict[kServerDataJSONKeyMedia] as? [Dictionary<String,Any>] {
            if let media_metaData = media.first?[kServerDataJSONKeyMediaMetaData] as? [Dictionary<String,Any>] {
                self.imageUrl = media_metaData.first?[kServerDataJSONKeyImageURL] as? String
            }
        }
    }
}
