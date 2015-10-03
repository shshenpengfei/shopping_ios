//
//  SpecialsForSupermarketTVCTableViewController.swift
//  shopping_ios
//
//  Created by shenpengfei on 15/10/2.
//  Copyright (c) 2015年 malls. All rights reserved.
//

import UIKit

class SpecialsForSupermarketTVCTableViewController: UITableViewController {
    
    @IBOutlet var FTableView: UITableView!
    
    
    let specialsItems = [
        Specials(name2: "西梅", brand2: "超达", category2: .food, price2: 2.8, originalPrice2: 5.3, imagesName2: "ximei"),
        Specials(name2: "iPhone 5s", brand2: "Apple", category2: .mobile, price2: 4188, originalPrice2: 4488, imagesName2: "iPhone5s"),
        Specials(name2: "好多鱼", brand2: "好丽友", category2: .food, price2: 11.8, originalPrice2: 13.4, imagesName2: "haoduoyu"),
        Specials(name2: "天然水", brand2: "农夫山泉", category2: .drink, price2: 26.9, originalPrice2: 32.0, imagesName2: "tianranshui"),
        Specials(name2: "柠檬片", brand2: "鲜引力", category2: .food, price2: 2.9, originalPrice2: 3.8, imagesName2: "ningmengpian"),
        Specials(name2: "杏仁露", brand2: "露露", category2: .drink, price2: 15.9, originalPrice2: 21.3, imagesName2: "xingrenlu"),
        Specials(name2: "小米4", brand2: "小米", category2: .mobile, price2: 2760, originalPrice2: 3200, imagesName2: "xiaomi4"),
        Specials(name2: "仙贝", brand2: "旺旺", category2: .food, price2: 20.8, originalPrice2: 28.2, imagesName2: "xianbei"),
        Specials(name2: "薯片", brand2: "乐事", category2: .food, price2: 19.9, originalPrice2: 23.9, imagesName2: "shupian"),
        Specials(name2: "瓜子", brand2: "正林", category2: .food, price2: 22.6, originalPrice2: 25.2, imagesName2: "guazi"),
        Specials(name2: "手撕牛肉", brand2: "棒棒娃", category2: .food, price2: 26.8, originalPrice2: 31.1, imagesName2: "shousiniurou")
    ]
    
    var categorySpecials = [Int:[Specials]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        for Specials in specialsItems{
            if categorySpecials[Specials.category.rawValue] == nil{
                categorySpecials[Specials.category.rawValue] = [Specials]
            }
            else{
                categorySpecials[Specials.category.rawValue]?.append(Specials)
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return categorySpecials.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        let categorysss = Array(categorySpecials.keys)
        return categorySpecials[categorysss[section]]!.count
    }

    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
//        let categoryss = Array(categorySpecials.keys)
//        var specialss = categorySpecials[categoryss[indexPath.section]]![indexPath.row]
//        cell.textLabel?.text = specialss.name
//        cell.detailTextLabel?.text = specialss.brand
//        
//        return cell
//    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SpecialsTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SpecialsCell", forIndexPath: indexPath) as! SpecialsTableViewCell
        let categoryssss = Array(categorySpecials.keys)
        var specialssss = categorySpecials[categoryssss[indexPath.section]]![indexPath.row]
        
        cell.nameLabel.text = specialssss.name
        cell.brandLabel.text = specialssss.brand
        cell.albumImageView.image = UIImage(named: specialssss.imagesName)
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
