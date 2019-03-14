

import UIKit



class helper {
    
   
    class func ShowCommomAlert(title:String, WithMessage message:String, showOnview:Any) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            }))
        (showOnview as! UIViewController).present(alert, animated: true, completion: nil)
        

    }
}
