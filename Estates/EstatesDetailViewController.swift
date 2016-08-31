
import UIKit

class EstatesDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var estatesImageView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    
    var estates:Estates!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Do any additional setup after loading the view.
        estatesImageView.image = UIImage(named: estates.image)
        
        // Change the color of the table view
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        // Remove the separators of the empty rows
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // Change the color of the separator       
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // Set the title of the navigator bar
        title = estates.name
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 240.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 1.0)
        
        // Enable self sizing cells
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EstatesDetailTableViewCell
        
    // Configure the cell..
    switch indexPath.row {
    case 0:
        cell.fieldLabel.text = "Name"
        cell.valueLabel.text =  estates.name
    case 1:
        cell.fieldLabel.text = "Type"
        cell.valueLabel.text =  estates.type
    case 2:
        cell.fieldLabel.text = "Location"
        cell.valueLabel.text =  estates.location
    case 3:
        cell.fieldLabel.text = "Been here"
        cell.valueLabel.text = (estates.isVisited) ? "Yes, I've been here before" : "No"
    default:
        cell.fieldLabel.text = ""
        cell.valueLabel.text = ""
}

    cell.backgroundColor = UIColor.clearColor()
        
    return cell
}

    
            
       }