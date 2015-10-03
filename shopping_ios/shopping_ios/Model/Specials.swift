//
//  Specials.swift
//  shopping_ios
//
//  Created by shenpengfei on 15/10/2.
//  Copyright (c) 2015年 malls. All rights reserved.
//

import UIKit

enum SpecialsCategory:Int{
    case food = 0,drink,clothing,staionery,mobile
}

class Specials:NSObject {
    var name:String = "" //商品名称
    var brand:String = "" //商品品牌
    var category:SpecialsCategory! //商品类别
    var price = 0.0  //商品价格
    var originalPrice = 0.0 //折扣前价格-原价
    var imagesName:String = "" //图片
    
    init(name2:String,brand2:String,category2:SpecialsCategory,price2:Double,originalPrice2:Double,imagesName2:String){
        self.name = name2
        self.brand = brand2
        self.category = category2
        self.price = price2
        self.originalPrice = originalPrice2
        self.imagesName = imagesName2
    }
   
}
