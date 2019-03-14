//
//  NYTimeArticleVC.swift
//  NYTimesApp
//
//  Created by Khushboo Kochar on 12/03/19.
//  Copyright © 2019 Khushboo Kochar. All rights reserved.
//

import UIKit

class NYTimeArticleVC: UIViewController {

    //MARK: Outlets
    var articleArray:[NYArtile] = []
    @IBOutlet weak var articleTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleTableView.accessibilityIdentifier = "table--articleTableView"
        if helper.isInternetAvailable()
        {
        self.getNYArticleApiCall()
        }
        else
        {
            helper.ShowCommomAlert(title: "Error", WithMessage: "Internet Not Available", showOnview: self)

        }
        
    }

    //MARK: Call NYTimes MostViewed API
    func getNYArticleApiCall(){
       
        NYTimesMostViewedAPI.nyTimesMostViewedGETAPI(section: "all-sections", period: 7, viewControler: self)
        
       
    }
    
    func reloadTableView(articleArray:[NYArtile])  {
        
        self.articleArray = articleArray
        self.articleTableView.delegate = self
        self.articleTableView.dataSource = self
        self.articleTableView.reloadData()
    }
    
}

extension NYTimeArticleVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "NYTimeArticleDetailVC") as! NYTimeArticleDetailVC
        articleDetailVC.atricleModel = self.articleArray[indexPath.row]
        self.navigationController?.pushViewController(articleDetailVC, animated: true)
    }
    
    
    
}

extension NYTimeArticleVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.articleTableView.dequeueReusableCell(withIdentifier: "NYTimesTableViewCell") as! NYTimesTableViewCell
      
        
        cell.articleTitleLabel.text = articleArray[indexPath.row].title
        cell.byLabel.text = articleArray[indexPath.row].byline
       cell.dateLabel.text = articleArray[indexPath.row].published_date
        if let urlString =  articleArray[indexPath.row].imageThumbnail
        {
            cell.thumbnailImageView.sd_setImage(with:URL(string: urlString) , completed: nil)
        }
        
        
        return cell
    }
    
 
}
