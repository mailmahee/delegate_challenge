//
//  CustomCell2.swift
//  amys_challenge
//
//  Created by Jill Robinson on 11/11/2016.
//  Copyright © 2016 Jill Robinson. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {

    var buttonClickingDelegate: CustomCellDelegate?
    
    @IBOutlet weak var CustomCellImage: UIImageView!
    
    @IBOutlet weak var CustomCellLabel: UILabel!
    
    @IBAction func DescriptionButtonPressed(sender: UIButton) {
        print("button in custom cell clicked")
        
        // we want to get data off of the main view controller 8***** delegate ****
        // go to the page (delegate) wher the desired method is found, then call that method
        buttonClickingDelegate?.buttonWasPressed(self)
        
    }

}
