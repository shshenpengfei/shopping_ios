import Foundation

class Item {
    var itemName:String = ""
    var brandName:String = ""
    var isBuy:Bool = false
    
    init(itemNameX:String,brandNameX:String,isBuyX:Bool){
        self.itemName = itemNameX
        self.brandName = brandNameX
        self.isBuy = isBuyX
    }
    
    convenience init(itemNameX:String){
        self.init(itemNameX:itemNameX,brandNameX:"",isBuyX:false)
    }
    
    convenience init(itemNameX:String,brandX:String){
        self.init(itemNameX:itemNameX,brandNameX:brandX,isBuyX:false)
    }
    
    func description()->String{
        return "itemName: \(itemName)    brandName: \(brandName)  isBuy: \(isBuy)"
    }
    
}