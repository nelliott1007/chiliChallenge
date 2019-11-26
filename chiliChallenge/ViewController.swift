import UIKit
import SCLAlertView
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {

    let sectionTitles = ["Appetizers","Entrees","Sides", "Drinks"]
    var numberOfItems = 0
    var item = ""
    var appetizers = ["Chips and Dip", "Nachos", "Calamari", "Queso Dip"]
    var entrees = ["Chicken", "Pasta", "Pizza", "Burger" ]
    var sides = ["Fries","Salad" ]
    var drinks = [ "Water", "Pop", "Alcohol"]
    
    
    @IBOutlet weak var chillis: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chillis.image = UIImage(named: "ch")
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func button(_ sender: Any)
    {
        return alert()
    }
   
    
    func alert()
    {
        let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello Customer", subTitle: "This is your order.")
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }
    
   

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
      {
          return 35
      }
      
      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
      {
          let label = UILabel()
          label.backgroundColor = .lightGray
          label.text = sectionTitles[section]
          label.font = UIFont(name: "Times", size: 30)
          return label
      }
      
      func numberOfSections(in tableView: UITableView) -> Int
      {
          return 4
      }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
      {
//     numberOfItems = appetizers.count + entrees.count + sides.count + drinks.count
        
             return 2
    }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if item == appetizers[indexPath.row]
       {
        cell?.textLabel?.text = item
        }
        else if item == entrees[indexPath.row]
        {
            cell?.textLabel?.text = item
        }
        else if item == sides[indexPath.row]
        {
            cell?.textLabel?.text = item
        }
        else if item == drinks[indexPath.row]
        {
            cell?.textLabel?.text = item
              print (item)
        }
        return cell!
      }
  
}

