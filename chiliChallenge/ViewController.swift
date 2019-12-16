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
        SCLAlertView().showInfo("Important info", subTitle: "You did it")
    }
    
   

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
      {
          return 35
      }
      
      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
      {
          let label = UILabel()
          label.backgroundColor = .red
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
        if sectionTitles == appetizers
        {
            return appetizers.count
        }
        else if sectionTitles == entrees
        {
            return entrees.count
        }
         else if sectionTitles == drinks
        {
            return drinks.count
        }
         else
        {
            return sides.count
        }
        
    }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
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
       // cell?.detailTextLabel = "hi"

        return cell!
      }
  
}

