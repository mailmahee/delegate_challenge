//
//  DescriptionViewController.swift
//  amys_challenge
//
//  Created by Jill Robinson on 10/11/2016.
//  Copyright © 2016 Jill Robinson. All rights reserved.
//

import Foundation
import UIKit

class DescriptionViewController: UIViewController, CancelButtonDelegate, updateDelegate {
    
    var buttonDelegate: CustomCellDelegate?
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var DescriptionImage: UIImageView!
    @IBOutlet weak var DescriptionText: UITextView!
    weak var CBDelegate: CancelButtonDelegate?
    var viewItem: [String] = []
    var itemToEditIndexPath: Int?
    weak var editDel: editDelegate?
    //var items = [["Yosemite", "National park"], ["Grand Canyon", "Big hole in the ground"], ["Yellowstone", "Big volcano in the ground"]]
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    //@IBAction func UpdateButtonPressed(sender: UIButton) {
        
    // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        DescriptionLabel.text = viewItem[0]
        DescriptionImage.image = UIImage(named: (DescriptionLabel.text)!)
        DescriptionText.text = viewItem[1]
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        print("Pressed cancel button in descriptionviewcontroller")
        print(CBDelegate)
        CBDelegate?.cancelButtonPressedFrom(self)
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        print("Received cancel button in cancelbuttondelegate")
        dismissViewControllerAnimated(true, completion: nil)
        self.cancelBarButtonPressed(cancelBarButton)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("In segue function in descriptionviewcontroller")
        if segue.identifier == "UpdateItem" {
            print("Received updateitem segue identifier")
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemViewController
            controller.CBDelegate = self
            controller.updateDel = self
            //controller.delegate = self
            //controller.itemImage.image = DescriptionImage.image
            controller.editItem = viewItem
            controller.itemToEditIndexPath = itemToEditIndexPath!
        }
    }
    
    @IBAction func updateButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("UpdateItem", sender: sender)
    }
    
    func itemViewController(controller: ItemViewController, didFinishEditingItem item: [String], atIndexPath indexPath: Int) {
        dismissViewControllerAnimated(true, completion: nil)
        print("Received in editingitem function in index view controller")
        DescriptionLabel.text = item[0]
        DescriptionImage.image = UIImage(named: (DescriptionLabel.text)!)
        DescriptionText.text = item[1]
        editDel?.descriptionViewController(self, didFinishEditingItem: item, atIndexPath: indexPath)
        
       /* items[indexPath] = item
        tableView.reloadData() */
        
    }
    
}
