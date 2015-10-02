import UIKit

protocol NewItemViewControllerDelegate{
    func addNewItem(controller:NewItemViewController,item:Item)
}

class NewItemViewController: UIViewController {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var brandNameTextField: UITextField!
    
    var item_newadd:Item?
    var delegate:NewItemViewControllerDelegate!
    
    @IBAction func saveItem(sender: UIButton) {
        if (!itemNameTextField.text.isEmpty &&  !brandNameTextField.text.isEmpty) {
            item_newadd = Item(itemName: itemNameTextField.text, brandName: brandNameTextField.text)
            delegate.addNewItem(self, item: item_newadd!)
            println("hello world \(itemNameTextField.text) ,\(brandNameTextField.text)")
        //    println("\(item_newadd)")
        }
        else{
            println("empty coming !!!!")
        }
        

        //dismissViewControllerAnimated(true, completion: nil)
        //delegate.addNewItem(self, item: item_newadd!)
        //if itemNameTextField.text != nil
        //    && brandNameTextField.text != nil{
        //item = Item(itemName: itemNameTextField.text, brandName: brandNameTextField.text)
        //}
        //dismissViewControllerAnimated(true, completion: nil)
        //print("44")
        //if itemNameTextField.text != nil && brandNameTextField.text != nil {
        //    print("555")
            // item = Item(itemName: itemNameTextField.text, brandName: brandNameTextField.text)
        //}
        //delegate.addNewItem(self, item: item!)
    }
    
    override func viewDidLoad() {
        //载入时加入焦点
        itemNameTextField.becomeFirstResponder()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}