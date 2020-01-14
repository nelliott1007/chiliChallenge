import UIKit
import SCLAlertView
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, UITextFieldDelegate {

    let sectionTitles = ["Appetizers","Entrees","Sides", "Drinks"]
    var numberOfItems = 0
    var item = ""
    var appetizers = ["Chips and Dip", "Nachos", "Calamari", "Queso Dip"]
    var entrees = ["Chicken", "Pasta", "Pizza", "Burger" ]
    var sides = ["Fries","Salad" ]
    var drinks = [ "Water", "Pop", "Alcohol"]
    
    
    @IBOutlet weak var chillis: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addtextField: UITextField!

    @IBOutlet weak var segAdd: UISegmentedControl!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var headerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Defaults = UserDefaults.standard
        if let storedInfo = Defaults.array(forKey: addtextField.text!){
            appetizers = storedInfo as! [String]
        }
        print(appetizers)
        chillis.image = UIImage(named: "ch")
        tableView.delegate = self
        tableView.dataSource = self
        addtextField.isHidden = true
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
         appetizers.append(addtextField.text!)
         tableView.reloadData()
         addtextField.text = nil
         let userDefaults = UserDefaults.standard
            userDefaults.set(appetizers, forKey: addtextField.text!)
         print(appetizers)
         return true
    }
    
    @IBAction func button(_ sender: Any)
    {
        return alert()
    }
   
    
  
    
    func alert()
    {
        let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello User", subTitle: "This is your order.")
        SCLAlertView().showInfo("Important info", subTitle: "Order Inputted")
    }
    
   

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
      {
          return 40
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
      
      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
      {
//
//        if section == 0
//               {
//                 return b1
//               }
//              else if section == 1
//               {
//                   return headerButton
//               }
//                else if section == 2
//               {
//                   return b1
//               }
//                else if section == 3
//               {
//                   return headerButton
//               }
//               else
//               {
//                   return b1
//               }
        
               let label = UILabel()
               label.backgroundColor = .red
               label.text = sectionTitles[section]
               label.font = UIFont(name: "Times", size: 30)
          return label
       
      }
    @IBAction func addition(_ sender: Any) {
        
    }
    
      func numberOfSections(in tableView: UITableView) -> Int
      {
         
          return 4
      }
      
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
      {
        if section == 0
        {
            return appetizers.count
        }
       else if section == 1
        {
            return entrees.count
        }
         else if section == 2
        {
            return sides.count
        }
         else if section == 3
        {
            return drinks.count
        }
        else
        {
            return 1
        }
        
    }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.imageView?.image = UIImage (named: "ch")
        cell?.textLabel?.font = UIFont(name: "Times", size: 15)
       
        
        if indexPath.section == 0 {
                     item = appetizers[indexPath.row]
            cell?.textLabel?.text = item
                  }
       else if  indexPath.section == 1 {
            item = entrees[indexPath.row]
            cell?.textLabel?.text = item
        }
        else if  indexPath.section == 2 {
                item = sides[indexPath.row]
            cell?.textLabel?.text = item
            }
        else if  indexPath.section == 3 {
                item = drinks[indexPath.row]
            cell?.textLabel?.text = item
            }
        else {
            print ("cell")
        }
      

        return cell!
      }
    
    @IBAction func barButton(_ sender: Any)
      {
       addtextField.isHidden = false
      addtextField.placeholder = "add"
      }
     
      
  
}

