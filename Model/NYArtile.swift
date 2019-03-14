

import Foundation
import SwiftyJSON

class NYArtile {
    
    var url: String?
    var byline: String?
    var title: String?
    var published_date: String?
    var abstract: String?
    var type: String?
    var source:String?
    var section:String?
    var imageThumbnail:String?
    var largeImage:String?
    
    
    init(json: JSON) {
        url = json["url"].stringValue
        byline = json["byline"].stringValue
        title = json["title"].stringValue
        published_date = json["published_date"].stringValue
        abstract = json["abstract"].stringValue
        type = json["type"].stringValue
        source = json["source"].stringValue
        section = json["section"].stringValue
        imageThumbnail = json["media"][0]["media-metadata"][1]["url"].string
        largeImage = json["media"][0]["media-metadata"][0]["url"].string
       
    }

    
    
 
}


