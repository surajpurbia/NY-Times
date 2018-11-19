//
//  NyNewsTableViewCell.swift
//  NY Times
//
//  Created by Suraj Purbia on 18/11/18.
//  Copyright © 2018 Suraj Purbia. All rights reserved.
//

import UIKit
import SDWebImage

class NyNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_title:UILabel!
    @IBOutlet weak var lbl_byline:UILabel!
    @IBOutlet weak var lbl_published_date:UILabel!
    @IBOutlet weak var img_dateIcon:UIImageView!
    @IBOutlet weak var img_newsIcon:UIImageView!

    var articleCellVM : ArticleCellViewModel? {
        didSet {
            
            guard let articleCellValue = articleCellVM else {
                return
            }
            
            lbl_title?.text = articleCellValue.title
            lbl_byline?.text = articleCellValue.byLineString
            lbl_published_date?.text = AppUtility.getStringFromDate(date: articleCellValue.publishedDate)
            
            if let urlStr = articleCellValue.imageUrl {
                let url = URL(string: urlStr)
                //Image Cache using SDWebImage
                img_newsIcon.sd_setShowActivityIndicatorView(true)
                img_newsIcon.sd_setIndicatorStyle(.gray)
                img_newsIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCellUI()
    {
        self.img_dateIcon?.image = #imageLiteral(resourceName: "date_icon")
        self.lbl_title?.textColor = kPrimaryTextColor
        self.lbl_byline?.textColor = kSecondryTextColor
        self.lbl_published_date?.textColor = kSecondryTextColor
    }
}
