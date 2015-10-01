//
//  ViewController.swift
//  shopping_ios
//
//  Created by shenpengfei on 15/9/29.
//  Copyright (c) 2015年 malls. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var mytableView: UITableView!
    
    let categoryList = [("牛奶","三元"),("方便面","康师傅"),("巧克力","德芙"),
        ("洗发水","飘柔"),("地板净","滴露"),("果汁","汇源"),("饮料","可口可乐"),("电器","海尔")];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //实现UITableViewDataSource中必须的继承方法区域
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return categoryList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell");
        
        let (item,brand) = categoryList[indexPath.row]
        cell.textLabel?.text = item
        cell.detailTextLabel?.text = brand
        //cell.textLabel?.text = "牛奶";
        return cell;
        
    }



}

