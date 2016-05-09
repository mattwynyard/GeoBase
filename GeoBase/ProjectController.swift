//
//  TableViewController.swift
//  GeoBase
//
//  Created by Matt Wynyard on 19/05/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class ProjectController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var projectList: Array<AnyObject> = []
    var selection: NSManagedObject?
    var selectionRow: Int?
    var defaultPath: NSIndexPath?
    var projectSwitch = UISwitch(frame:CGRectMake(150, 300, 0, 0));
    var currentCell: UITableViewCell!
    var previousCell: UITableViewCell!
    var isLocked: Bool  = false
    var currentProject: String?
    
    //@IBOutlet weak var emailButton: UIBarButtonItem!
    @IBOutlet weak var emailButton: UIBarButtonItem!
    @IBOutlet weak var lockButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let fetch = NSFetchRequest(entityName: "Project")
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.scrollEnabled = true
        
        //populate project array
        projectList = try! context.executeFetchRequest(fetch)
        //println(projectList)
        navigationController?.toolbarHidden = false
        tableView.showsVerticalScrollIndicator = true
        tableView.reloadData()
        
        if defaultPath == nil { //no cell selection
            editButton.enabled = false
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.toolbarHidden = false
        loadData()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tableRow = defaults.integerForKey("tableRow")
        let indexPath = NSIndexPath(forRow: tableRow, inSection: 0)
        currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        currentCell.accessoryType = .Checkmark
        currentProject = defaults.stringForKey("currentProject")
        print(currentProject!)
        
        
        
        self.tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
        currentCell.accessoryType = .Checkmark
        currentCell.selectionStyle = .Blue
        
//        if isLocked == nil {
//            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isLocked")
//            lockButton.title = "Lock"
//        }
        
        isLocked = NSUserDefaults.standardUserDefaults().boolForKey("isLocked")
        print(isLocked)
        if isLocked == true {
            lockButton.title = "Unlock"
        } else {
            lockButton.title = "Lock"
        }

    }

    override func viewDidAppear(animated: Bool) {
        
        //tableView.showsVerticalScrollIndicator = true
    }
    
    override func viewWillDisappear(animated: Bool) {
    
        navigationController?.toolbarHidden = true //hide toolbar for other view controllers
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() { //update to return context
        
        //let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let fetch = NSFetchRequest(entityName: "Project")
        projectList = try! context.executeFetchRequest(fetch)
        tableView.reloadData()
        
    }
    
    /*
    * Called when row on table view is selected
    * sets current cell and current project
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath?) {
        
        if isLocked {
            return
        }
        
        let indexPath = tableView.indexPathForSelectedRow;
        previousCell = currentCell
        previousCell.accessoryType = .None
        currentCell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!;
        editButton.enabled = true
        currentCell.accessoryType = .Checkmark
        currentProject = currentCell.textLabel?.text!
        print(currentProject!)
        NSUserDefaults.standardUserDefaults().setInteger(indexPath!.row, forKey: "tableRow")
        NSUserDefaults.standardUserDefaults().setValue(currentProject!, forKey: "currentProject")
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return projectList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath!) 
        
        if let ip = indexPath {
            let data: NSManagedObject = projectList[ip.row] as! NSManagedObject
            cell.textLabel?.text = data.valueForKeyPath("project") as? String
            cell.detailTextLabel?.text = data.valueForKeyPath("date_created") as? String
            //
        }
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
        
    }
    
    /*
    * sets lock button title and state when pushed and saves state to NSUser defaults
    */
    @IBAction func lockButton(sender: AnyObject) {
        
        if isLocked == true {
            lockButton.title = "Lock"
            isLocked = false
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isLocked")
        } else {
            lockButton.title = "Unlock"
            isLocked = true
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isLocked")
        }
    }
    
    @IBAction func emailData(sender: AnyObject) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["mjwynyard.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if isLocked {
            return
        }
        
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let message: String = "WARNING\nDo you want to delete this project?\nAll data related to this project will be deleted permenantly"
        let alertController = UIAlertController(title: "DELETE PROJECT!", message: message, preferredStyle: .Alert)
        
        if editingStyle == .Delete {
            
            //if tableView != nil {
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                tableView.reloadData()
                
            }
            alertController.addAction(cancelAction)
            let OKAction = UIAlertAction(title: "Ok", style: .Destructive) { (action) in
                
                context.deleteObject(self.projectList[indexPath.row] as! NSManagedObject)
                self.projectList.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true)  {
                
            }
            
        }
        var error: NSError?
        do {
            try context.save()
        } catch let error1 as NSError {
            error = error1
            abort()
        }
    }
    
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
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        //editButton.enabled = true
        if segue.identifier == "Update" {
            selection = projectList[self.tableView.indexPathForSelectedRow!.row] as? NSManagedObject
            let projectDC: ProjectDetailController = segue.destinationViewController as! ProjectDetailController
        
            projectDC.project = selection?.valueForKeyPath("project") as! String
            projectDC.date_created = selection?.valueForKeyPath("date_created") as! String
            
            if selection?.valueForKeyPath("notes") != nil { //if notes are empty avoid unwrapping nil
                projectDC.notes = selection?.valueForKeyPath("notes") as! String
            } else {
               projectDC.notes = ""
            }
            projectDC.existingItem = selection
            //println(selection)
            projectDC.update = true
            
        }
    }
} //end class
