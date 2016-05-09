//
//  SettingsController.swift
//  GeoBase
//
//  Created by Matt Wynyard on 29/04/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var tableMembers: Array<String>!//can change to immutable length once total cells known
    var northSwitchBool: Bool!
    //var northSwitch = UISwitch(frame:CGRectMake(150, 300, 0, 0));
    var northSwitch = UISwitch(frame:CGRectMake(150, 300, 0, 0));
    var dataPrefix = UITextField(frame:CGRect(x: 0, y: 0, width: 150.00, height: 40.00));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        dataPrefix.textColor = UIColor.redColor()
        dataPrefix.placeholder = "Enter prefix here"
        
        restoreSwitchesStates()
        
        tableMembers = ["Use True North", "Measurement Style", "Project", "About"]
        print("array built")


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tableMembers.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = myTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        let accessoryTypes: [UITableViewCellAccessoryType] = [.None, .DisclosureIndicator, .DisclosureIndicator, .DisclosureIndicator]
  
        northSwitch.addTarget(self, action: Selector("northSwitchDidChange:"), forControlEvents: UIControlEvents.ValueChanged);
        cell.textLabel?.text = tableMembers[indexPath.row]
       
        if indexPath.row == 0 {
            cell.accessoryView = northSwitch
//        } else if indexPath.row == 2 {
//            cell.accessoryView = dataPrefix
            
        } else {
            cell.accessoryType = accessoryTypes[indexPath.row % accessoryTypes.count]
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //println(indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 1 {
        
            //creates veiw new view controller instance
            let measureController = storyboard?.instantiateViewControllerWithIdentifier("MeasurementController") as!UIViewController!
            navigationController?.pushViewController(measureController, animated: true)
        }
        
        if indexPath.row == 3 {
            
            //creates veiw new table view controller for project settings
            let projectController = storyboard?.instantiateViewControllerWithIdentifier("ProjectController") as! UITableViewController
            navigationController?.pushViewController(projectController, animated: true)
        }
        
        
    }
    
    func northSwitchDidChange(switchState: UISwitch) {
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "saveSwitchesStates", name: "SaveSwitchesStatesNotification", object: nil);
        if switchState.on {
            northSwitchBool = true
            print("switch is on")
        } else {
            northSwitchBool = false
            print("switch is of")
        }
        saveSwitchesStates()
    }
    
    func restoreSwitchesStates() {
        
        print("restore")
        northSwitch.on = NSUserDefaults.standardUserDefaults().boolForKey("northSwitch");
        
//        if northSwitchBool {
//           northSwitch.on = true
//        } else {
//            northSwitch.on = false
//        }
        
    }
    
    func saveSwitchesStates() {
        
        print("save")
        NSUserDefaults.standardUserDefaults().setBool(northSwitch.on, forKey: "northSwitch")
        NSUserDefaults.standardUserDefaults().synchronize();
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
