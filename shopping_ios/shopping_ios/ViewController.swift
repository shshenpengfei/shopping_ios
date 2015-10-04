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
    
    let launchImgUrl = "https://news-at.zhihu.com/api/4/start-image/640*1136?client=0"

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
        showLauchImage()
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
    
    func showLauchImage () {
        YRHttpRequest.requestWithURL(launchImgUrl,completionHandler:{ data in
            if data as! NSObject == NSNull()
            {
                return
            }
            
            let imgUrl = data["img"] as! String
            
            let height = UIScreen.mainScreen().bounds.size.height
            let width = UIScreen.mainScreen().bounds.size.width
            let img = UIImageView(frame:CGRectMake(0, 0, width, height))
            img.backgroundColor = UIColor.blackColor()
            img.contentMode = UIViewContentMode.ScaleAspectFit
            
            let window = UIApplication.sharedApplication().keyWindow
            window!.addSubview(img)
            img.setImage(imgUrl,placeHolder:nil)
            
            let lbl = UILabel(frame:CGRectMake(0,height-50,width,20))
            lbl.backgroundColor = UIColor.clearColor()
            lbl.text = data["text"] as? String
            lbl.textColor = UIColor.lightGrayColor()
            lbl.textAlignment = NSTextAlignment.Center
            lbl.font = UIFont.systemFontOfSize(14)
            window!.addSubview(lbl)
            
            UIView.animateWithDuration(3,animations:{
                let height = UIScreen.mainScreen().bounds.size.height
                let rect = CGRectMake(-100,-100,width+200,height+200)
                img.frame = rect
                },completion:{
                    (Bool completion) in
                    
                    if completion {
                        UIView.animateWithDuration(1,animations:{
                            img.alpha = 0
                            lbl.alpha = 0
                            },completion:{
                                (Bool completion) in
                                
                                if completion {
                                    img.removeFromSuperview()
                                    lbl.removeFromSuperview()
                                }
                        })
                    }
            })
        })
        
    }

    
    //但点击某一个单元格时，就会触发这个方法
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //切换一个viewcontroller，目标的编号是itemShowSegue，第二个参数传递了一个NSindexPath类型的变量，告诉选择了哪一个部分的单元格。
        performSegueWithIdentifier("itemShowSegue", sender: indexPath.row)
    }

    //实现UITableViewDataSource协议中额方法，用于设置指定的单元格是否允许编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if(indexPath.row<4){
            return true   //前四个可以删除
        }
        else{
            return false
        }
    }
    
    //设置指定的单元格的编辑风格类型
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath	 indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    //处理用户与单元格的交互操作
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            categoryList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
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

