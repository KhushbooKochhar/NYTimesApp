

class SuperEntity : PPJSONSerialization{
    
    func toArry() -> [Any] {
        var resultArry : [Any] = [Any]()
        let dicToConvert = self.toDictionary()
        for (_ , val) in dicToConvert {
            resultArry.append(val)
        }
        return resultArry
    }
    
    func toDictionary() -> [String:AnyObject] {
        let dict = [String:Any]()
        return dict as [String : AnyObject]
    }
    
    func toObject(dict : [String : Any]) -> Any {
        return self
    }
    
    func toInsert() -> (paramString : String, valueArry : [Any], insertString : String) {
        var resultString : String = String()
        var resultArry : [Any] = [Any]()
        var resultStringQ : String = String()
        let dicToConvert = self.toDictionary()
        resultString = "("
        resultStringQ = "("
        for (key , val) in dicToConvert {
            resultString = "\(resultString) \(key),"
            resultArry.append(val)
            resultStringQ = "\(resultStringQ) ?,"
        }
        resultString.remove(at: resultString.index(before: resultString.endIndex))
        resultString += " )"
        resultStringQ.remove(at: resultStringQ.index(before: resultStringQ.endIndex))
        resultStringQ += " )"
        
        return (resultString, resultArry, resultStringQ)
    }
    
    func toUpdate(idKey : String, idValue : Int) -> (paramString : String, valueArry : [Any]) {
        var resultString : String = String()
        var resultArry : [Any] = [Any]()
        let dicToConvert = self.toDictionary()
        for (key , val) in dicToConvert {
            if(key != idKey){
                resultString = "\(resultString) \(key) = ?,"
                resultArry.append(val)
            }
        }
        resultString.remove(at: resultString.index(before: resultString.endIndex))
        resultArry.append(idValue)
        //print(resultString)
       // print(resultArry)
        return (resultString, resultArry)
    }
    
    func getId () -> (value : Int, param : String) {
        return (0, "")
    }
}
