//
//  helper.swift
//  1View
//
//  Created by Pritesh on 12/01/17.
//  Copyright © 2017 ChannelPlay. All rights reserved.
//

import UIKit



class helper {
    
   
    class func ShowCommomAlert(title:String, WithMessage message:String, showOnview:Any) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default: break
                
            case .cancel: break
                
            case .destructive: break
                
                
            }}))
        (showOnview as! UIViewController).present(alert, animated: true, completion: nil)
        

    }
}
