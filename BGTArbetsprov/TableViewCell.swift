//
//  TableViewCell.swift
//  BGTArbetsprov
//
//  Created by Daniel T. Barwén on 2018-06-27.
//  Copyright © 2018 Daniel T. Barwén. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item : RSSItem! {
        didSet {
            titleLabel.text = item.title
            dateLabel.text = item.pubDate
            descriptionLabel.text = item.description
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
