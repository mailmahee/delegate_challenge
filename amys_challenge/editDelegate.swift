
//
//  editDelegate.swift
//  amys_challenge
//
//  Created by Jill Robinson on 11/11/2016.
//  Copyright © 2016 Jill Robinson. All rights reserved.
//

import Foundation

protocol editDelegate: class {
    
    func descriptionViewController(controller: DescriptionViewController, didFinishEditingItem item: [String], atIndexPath indexPath: Int)
}
