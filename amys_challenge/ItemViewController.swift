//
//  ItemViewController.swift
//  amys_challenge
//
//  Created by Jill Robinson on 10/11/2016.
//  Copyright © 2016 Jill Robinson. All rights reserved.
//

import Foundation
import UIKit

class ItemViewController: UIViewController {
    
    weak var CBDelegate: CancelButtonDelegate?
    var editItem: [String] = []
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UITextField!
    @IBOutlet weak var itemText: UITextView!
    var item: [String] = ["item1", "item2"]
    var itemToEditIndexPath: Int?
    weak var addDel: addDelegate?
    weak var updateDel: updateDelegate?
    
    
       @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        print("Pressed cancel button in itemviewcontroller")
        print(CBDelegate!)
        CBDelegate?.cancelButtonPressedFrom(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if editItem == [] {
            itemLabel.text = ""
            itemText.text = ""
        } else {
            itemLabel.text = editItem[0]
            itemText.text = editItem[1]
            itemImage.image = UIImage(named: (itemLabel.text)!)
        }
    }
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        if editItem != [] {
            print(item)
            print(itemLabel.text)
            item[0] = itemLabel.text!
            item[1] = itemText.text!
            print(item)
            print("updating in item view controller!")
            updateDel?.itemViewController(self, didFinishEditingItem: item , atIndexPath: itemToEditIndexPath!)
        } else {
            item[0] = itemLabel.text!
            item[1] = itemText.text!
             print("adding in item view controller!")
            addDel?.itemViewController(self, didFinishAddingItem: item)
        }
    }
    
}
