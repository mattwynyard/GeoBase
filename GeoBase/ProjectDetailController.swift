//
//  ProjectDetailController.swift
//  GeoBase
//
//  Created by Matt Wynyard on 19/05/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ProjectDetailController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var projectLabel: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveButton: SaveButton!
    @IBOutlet weak var exportButton: UIBarButtonItem!
    
    var project: String = ""
    var date_created: String = ""
    var notes: String = ""
    var existingItem: NSManagedObject?
    var update: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //projectLabel.delegate = self
        if existingItem != nil {
            projectLabel.text = project
            dateLabel.text = date_created
            notesTextView.text = notes
        }
        
        print(update) //DEBUG
        
        if !update {
            let date = NSDate()
            let formatter = NSDateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            dateLabel.text = formatter.stringFromDate(date)
            saveButton.setTitle("Create", forState: UIControlState.Normal)
            exportButton.enabled = false
        } else {
            dateLabel.text = date_created
            saveButton.setTitle("Update", forState: UIControlState.Normal)
            exportButton.enabled = true
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool { // called when 'return' key pressed. return NO to ignore.
        
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Project", inManagedObjectContext: context)
        let message: String = "Create new project? " + "\(projectLabel.text!)"
        let alertController = UIAlertController(title: "Save to Database", message: message, preferredStyle: .Alert)
        
        if existingItem != nil {
            existingItem?.setValue(projectLabel.text, forKey: "project")
            existingItem?.setValue(notesTextView.text, forKey: "notes")
            do {
                try context.save()
            } catch _ {
            }
            self.navigationController?.popViewControllerAnimated(true)
            
        } else {
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                
                //self.navigationController?.popViewControllerAnimated(true)
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "Save", style: .Default) { (action) in
                let newRecord = Project(entity: entity!, insertIntoManagedObjectContext: context)
                newRecord.notes = self.notesTextView.text!
                newRecord.project = self.projectLabel.text!
                newRecord.date_created = self.dateLabel.text!
                //println(self.notesTextView.text) //DEBUG
                
                self.navigationController?.popViewControllerAnimated(true)

                do {
                    try context.save()
                } catch _ {
                }
                
            }
            alertController.addAction(OKAction)
            
            
           self.presentViewController(alertController, animated: true) {
                
                // ...
            }
            
        }
        //self.navigationController?.popViewControllerAnimated(true)

    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
