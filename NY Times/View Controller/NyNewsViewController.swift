//
//  NyNewsViewController.swift
//  NY Times
//
//  Created by Suraj Purbia on 18/11/18.
//  Copyright © 2018 Suraj Purbia. All rights reserved.
//

import UIKit
let kEstimatedNewsRableRowHeight:CGFloat = 100.0

class NyNewsViewController: UIViewController {
    
        @IBOutlet weak var articleTableView:UITableView!
        @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
        
        var dataSource = NewsDataSource()
        
        lazy var viewModel : ArticleViewModel = {
            let viewModel = ArticleViewModel(dataSource: dataSource)
            return viewModel
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            setUpIntials()
        }
        
        //MARK:- UI setu methods
        
        func setUpIntials() {
            
            //Setup UI
            self.title = kNewsTitleString
            self.activityIndicator.stopAnimating()
            
            self.articleTableView.rowHeight = UITableView.automaticDimension
            self.articleTableView.estimatedRowHeight = kEstimatedNewsRableRowHeight
            
            //Setup datasource
            self.articleTableView.dataSource = self.dataSource
            self.dataSource.data.addAndNotify(observer: self) { [weak self] in
                self?.articleTableView.reloadData()
            }
            
            // Fetch article if network available
            AppUtility.isConnectedToNetwork() ? fetchArticle() : showAlertWithMessgae(message: kNoNetworkErrorMessgae)
        }
        
        func fetchArticle()
        {
            self.activityIndicator.startAnimating()
            self.viewModel.fetchArticles({[weak self] result in
                
                self?.activityIndicator.stopAnimating()
                
                switch result{
                case .failure(let error):
                    self?.showAlertWithMessgae(message: error.localizedDescription)
                    
                default:
                    NSLog("sucess")
                }
            })
        }
        
        //MARK:- Alert
        func showAlertWithMessgae(message:String) {
            
            let alertView = UIAlertController(title: title,
                                              message: message,
                                              preferredStyle: .alert)
            let action = UIAlertAction(title: kOkButtonTitle, style: .default, handler: nil)
            alertView.addAction(action)
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    //MARK:- Extension for TableViewDelegate handling
    extension NyNewsViewController:UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: kNewDetailSegue, sender: self.dataSource.data.value[indexPath.row])
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == kNewDetailSegue {
                let newsDetailVC = segue.destination as? NewsDetailViewController
                newsDetailVC?.detailNews = (sender as! ArticleCellViewModel).captionInfo
                newsDetailVC?.detailNewsImageUrl = (sender as! ArticleCellViewModel).imageUrl
                
            }
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 1.0
        }
}

