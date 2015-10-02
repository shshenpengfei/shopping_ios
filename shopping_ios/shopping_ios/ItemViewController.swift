import UIKit
class ItemViewShowController: UIViewController {
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var brandNameLabel: UILabel!
    
    var itemName:String?
    
    var brandName:String?
    
    
//    func viewWillAppear(animated: Bool) // Called when the view is about to made visible. Default does nothing
    
    override func viewWillAppear(animated: Bool) {
        if itemName != nil{
            itemNameLabel.text = itemName
        }
        
        if brandName != nil{
            brandNameLabel.text = brandName
        }
    }
    
    
    @IBAction func isBuy(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}