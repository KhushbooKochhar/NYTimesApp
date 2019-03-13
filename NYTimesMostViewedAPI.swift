//
//  NYTimesMostViewedAPI.swift
//  NYTimesApp
//
//  Created by Khushboo Kochar on 13/03/19.
//  Copyright © 2019 Khushboo Kochar. All rights reserved.
//

import UIKit
import MBProgressHUD


class NYTimesMostViewedAPI {

    class func nyTimesMostViewedGETAPI(section:String,period:Int,viewControler:NYTimeArticleVC) {
        
        let strURL = Constant.ApiPath.baseUrl+"\(section)/\(period).json?api-key=\(Constant.ApiKey.apiKey)"
        
        let hud = MBProgressHUD.showAdded(to: viewControler.view, animated: true);
         var  articleArray:[NYArtile] = []
        
        APIWrapper.requestGETURL(strURL, success: {
            (JSONResponse) -> Void in
            hud.hide(animated: true)
            
            print(JSONResponse)
            let status = JSONResponse["status"]
            if status == "OK"
            {
                
                
               
                for (dictJSON) in JSONResponse["results"].arrayValue {
                    
 
                    
                let dict = dictJSON.dictionaryValue
                   let articleModel = NYArtile()
                    articleModel.abstract = dict["abstract"]?.stringValue ?? ""
                    articleModel.byline = dict["byline"]?.stringValue ?? ""
                    articleModel.published_date = dict["published_date"]?.stringValue ?? ""
                    articleModel.title = dict["title"]?.stringValue ?? ""
                    articleModel.url = dict["url"]?.stringValue ?? ""
                    articleArray.append(articleModel)
                    
                   

                }
                
                DispatchQueue.main.async {
                    
                viewControler.reloadTableView(articleArray:articleArray)
                }
                
            }
                
            
            
            else {
                //helper.ShowCommomAlert(title: "Error".localized, WithMessage: "ExceptionMsg".localized, showOnview: viewController)
                
            }
            
            
        }) {
            (error) -> Void in
             hud.hide(animated: true)
            helper.ShowCommomAlert(title: "Error", WithMessage: error.localizedDescription, showOnview: viewControler)
        }
     
    }

    
   
}
