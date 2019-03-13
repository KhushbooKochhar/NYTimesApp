//
//  NYTimesTableViewCell.swift
//  NYTimesApp
//
//  Created by Khushboo Kochar on 12/03/19.
//  Copyright © 2019 Khushboo Kochar. All rights reserved.
//

import UIKit

class NYTimesTableViewCell: UITableViewCell {

    //MARK:IBOutlets
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    @IBOutlet weak var byLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
