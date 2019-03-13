

import Foundation

class NYArtile: SuperEntity {
    
    var url: String = ""
    var byline: String = ""
    var title: String = ""
    var published_date: String = ""
    var abstract: String = ""
   
    
//    override func toObject(dict : [String : Any]) -> Any {
//        self.url = dict["url"] as? String ?? ""
//        self.byline = dict["byline"] as? String ?? ""
//        self.published_date = dict["published_date"] as? String ?? ""
//        self.abstract = dict["abstract"] as? String ?? ""
//        
//        return self
//    }
 
}


