import UIKit
class ItemViewShowController: UIViewController {
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var brandNameLabel: UILabel!
    
    //var itemName:String?
    //var brandName:String?
    
    var item:Item?
    
    
    
//    func viewWillAppear(animated: Bool) // Called when the view is about to made visible. Default does nothing
    
    override func viewWillAppear(animated: Bool) {
        //if itemName != nil{
        //    itemNameLabel.text = itemName
        //}
        
        //if brandName != nil{
        //    brandNameLabel.text = brandName
        //}
        if item != nil{
            itemNameLabel.text = item?.itemName
            brandNameLabel.text = item?.brandName
        }
    }
    
    
    @IBAction func isBuy(sender: UIButton) {
        if item != nil{
            if(item?.isBuy == true){
                item?.isBuy = false
                itemNameLabel.textColor = UIColor.blackColor()
            }
            else{
                item?.isBuy = true
                itemNameLabel.textColor = UIColor.greenColor()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}