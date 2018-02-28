//
//  ShowBookViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import CoreData

/*
            ShowBookViewController
            **********************
 
 This view controller manages the settings, logics,
 logics, and segue when the user clicks on a specific
 book cell. Most of the UI is done on the storyboard,
 therefore Segue triggers and CoreData are handled here

 */



class ShowBookViewController : UIViewController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { return }
        
        switch segueIdentifier {
        case "save":
            print("save bar button item tapped")
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
