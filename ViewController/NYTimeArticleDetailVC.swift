//
//  NYTimeArticleDetailVC.swift
//  NYTimesApp
//
//  Created by Khushboo Kochar on 12/03/19.
//  Copyright © 2019 Khushboo Kochar. All rights reserved.
//

import UIKit
import SDWebImage

class NYTimeArticleDetailVC: UIViewController {

    //MARK: IBOutlets
    var atricleModel:NYArtile?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var abstractLabel: UILabel!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        guard let atricleModel = self.atricleModel else {return}
        
            if let imageString = atricleModel.largeImage
            {
            imageView.sd_setShowActivityIndicatorView(true)
            imageView.sd_setIndicatorStyle(.gray)
            imageView.sd_setImage(with:URL(string: imageString) , completed: nil)
            }
        
            abstractLabel.text = atricleModel.abstract
            sectionLabel.text = atricleModel.section
            sourceLabel.text = atricleModel.source
        
        
    }
    

    

}

