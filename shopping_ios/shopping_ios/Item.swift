//import Foundation
//
//class Item {
//    /**
//    var categoryList = [("牛奶","三元"),("方便面","康师傅"),("巧克力","德芙"),
//        ("洗发水","飘柔"),("地板净","滴露"),("果汁","汇源"),("饮料","可口可乐"),("电器","海尔")];
//    */
//    var itemName:String = ""
//    var brandName:String = ""
//    var isBuy:Bool = false
//    
//    init(itemNameX:String,brandNameX:String,isBuyX:Bool){
//        self.itemName = itemNameX
//        self.brandName = brandNameX
//        self.isBuy = isBuyX
//    }
//    
//    convenience init(itemNameX:String){
//        self.init(itemNameX:itemNameX,brandNameX:"",isBuyX:false)
//    }
//    
//    convenience init(itemNameX:String,brandX:String){
//        self.init(itemNameX:itemNameX,brandNameX:brandX,isBuyX:false)
//    }
//    
//    func description()->String{
//        return "itemName: \(itemName)    brandName: \(brandName)  isBuy: \(isBuy)"
//    }
//    
//}
//
//  Item.swift
//  Shopping
//
//  Created by 铭刘 on 14/9/17.
//  Copyright (c) 2014年 刘铭. All rights reserved.
//
import Foundation

class Item {
    var itemName: String = ""
    var brandName: String = ""
    var isBuy: Bool = false
    
    init(itemName: String, brandName: String, isBuy: Bool){
        self.itemName = itemName
        self.brandName = brandName
        self.isBuy = isBuy
    }
    
    convenience init(itemName: String){
        self.init(itemName: itemName, brandName: "", isBuy: false)
    }
    
    convenience init(itemName: String, brandName: String){
        self.init(itemName: itemName, brandName: brandName, isBuy: false)
    }
    
    func description()->String{
        return "itemName: \(itemName)  brandName: \(brandName)  isBuy: \(isBuy)"
    }
    
}