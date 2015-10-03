//
//  ViewController.swift
//  shopping_ios
//
//  Created by shenpengfei on 15/9/29.
//  Copyright (c) 2015年 malls. All rights reserved.
//

import UIKit

//继承 delegate，datasource类，并需要实现其中的必要方法。
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,
NewItemViewControllerDelegate{

    @IBOutlet weak var mytableView: UITableView!
    var categoryList = [
        Item(itemName: "牛奶", brandName: "三元"),
        Item(itemName: "方便面", brandName: "康师傅"),
        Item(itemName: "巧克力", brandName: "德芙"),
        Item(itemName: "洗发水", brandName: "飘柔"),
        Item(itemName: "地板净", brandName: "滴露"),
        Item(itemName: "果汁", brandName: "汇源"),
        Item(itemName: "饮料", brandName: "可口可乐"),
        Item(itemName: "电器", brandName: "海尔")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mytableView.reloadData()
    }
    
    func addNewItem(controller: NewItemViewController, item: Item) {
        categoryList.append(item)
        mytableView.reloadData()
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //实现UITableViewDataSource中必须的继承方法区域
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return categoryList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell");
        
        //let (item,brand) = categoryList[indexPath.row]
        let item = categoryList[indexPath.row]
        cell.textLabel?.text = item.itemName
        if item.isBuy{
            cell.textLabel?.textColor = UIColor.greenColor()
        }
        else{
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        cell.detailTextLabel?.text = item.brandName
        //cell.textLabel?.text = item
        //cell.detailTextLabel?.text = brand
        //cell.textLabel?.text = "牛奶";
        return cell;
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("itemShowSegue", sender: indexPath.row)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "itemShowSegue" {
            var destination:ItemViewShowController = segue.destinationViewController as! ItemViewShowController
            if sender is Int{
                //var (itemName,brandName) = categoryList[sender as! Int]
                var item = categoryList[sender as! Int]
                destination.item = item
                //destination.itemName = itemName
                //destination.brandName = brandName
            }
        }
        else if segue.identifier == "newItemSegue"{
            var destination:NewItemViewController = segue.destinationViewController as! NewItemViewController
            destination.delegate = self
        }
    }


}

