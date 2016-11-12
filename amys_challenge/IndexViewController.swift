//
//  ViewController.swift
//  amys_challenge
//
//  Created by Jill Robinson on 10/11/2016.
//  Copyright © 2016 Jill Robinson. All rights reserved.
//

import UIKit

class IndexViewController: UITableViewController, CustomCellDelegate, CancelButtonDelegate, addDelegate, editDelegate {
    
    var items = [["Yosemite", "National park"], ["Grand Canyon", "Big hole in the ground"], ["Yellowstone", "Big volcano in the ground"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        
        cell.buttonClickingDelegate = self
        cell.tag = indexPath.row
        print(cell.tag)
        print(indexPath.row)
        print("item \(items[indexPath.row])")
        cell.CustomCellLabel?.text = items[indexPath.row][0]
        cell.CustomCellImage.image = UIImage(named: (cell.CustomCellLabel?.text)!)
        //cell.CustomCellText?.text = items[indexPath.row][1]

        return cell
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        print("Received cancel button in cancelbuttondelegate")
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("in prepare")
        
        if segue.identifier == "ViewDescription" {
            print("viewdescription")
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! DescriptionViewController
            print("Hello")
            controller.CBDelegate = self
            controller.editDel = self
            print("sender:",sender as! UITableViewCell)
            if let indexPath = tableView.indexPathForCell(sender as! CustomCell) {
                print("indexPath",indexPath)
                print(items[indexPath.row])
                controller.viewItem = items[indexPath.row]
                controller.itemToEditIndexPath = indexPath.row
            }

            
        } else if segue.identifier == "AddItem" {
            print("AddItem")
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemViewController
            controller.CBDelegate = self
            controller.addDel = self
            //controller.delegate = self
            
            // Here we set the missionToEdit so that we can have the mission text on the MissionDetailsViewController
            
        }
        
    }
    
    func buttonWasPressed(sender: CustomCell){
        print("Delegate noticed that a button was pressed in the custom cell")
        performSegueWithIdentifier("ViewDescription", sender: sender)
    }

    
    func descriptionViewController(controller: DescriptionViewController, didFinishEditingItem item: [String], atIndexPath indexPath: Int) {
        print("Received in editingitem function in index view controller")
        items[indexPath] = item
        
    }
    
    func itemViewController(controller: ItemViewController, didFinishAddingItem item: [String]) {
        dismissViewControllerAnimated(true, completion: nil)
        print("Received in addingitem function in index view controller")
        items.append(item)
        tableView.reloadData()
    }

}

