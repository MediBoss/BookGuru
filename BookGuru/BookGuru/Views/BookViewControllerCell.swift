//
//  BookViewControllerCell.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

/*
 This View Controller manages the three @IBOULETS that composes
 the Table cell : The book Title, the Date of modification, and The UIImageView
 */


import UIKit
import Foundation

class BookViewControllerCell : UITableViewCell{
    
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var modificationTimeLabel: UILabel!
}
