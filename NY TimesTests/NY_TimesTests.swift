//
//  NY_TimesTests.swift
//  NY TimesTests
//
//  Created by Suraj Purbia on 18/11/18.
//  Copyright © 2018 Suraj Purbia. All rights reserved.
//

import XCTest
@testable import NY_Times

class NY_TimesTests: XCTestCase {
    
    var dataSource : NewsDataSource!

    override func setUp() {
        dataSource = NewsDataSource()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        dataSource = nil

        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        //  one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, " one section in table view")
        
        //  zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "zero cell in table view")
    }
    
    func testValueInDataSource() {
        
        // giving data value
        let dummyArticleCellVM1 = ArticleCellViewModel(article: Article(articleDict: ["title":"My title1"])!)
        let dummyArticleCellVM2 = ArticleCellViewModel(article: Article(articleDict: ["title":"My title2"])!)
        dataSource.data.value = [dummyArticleCellVM1, dummyArticleCellVM2]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        //  one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "one section in table view")
        
        //  two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "two cell in table view")
    }
    
    func testValueCell() {
        
        // giving data value
        let dummyArticleCellVM1 = ArticleCellViewModel(article: Article(articleDict: ["title":"My title1"])!)
        dataSource.data.value = [dummyArticleCellVM1]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(NyNewsTableViewCell.self, forCellReuseIdentifier: kArticleCellID)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected ArticleTableViewCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? NyNewsTableViewCell else {
            XCTAssert(false, "NyNewsTableViewCell class")
            return
        }
    }
}
