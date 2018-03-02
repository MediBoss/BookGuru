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
   
    // - MARK : IBOULETS
    
    @IBOutlet weak var bookNameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var lastPageReadTextField: UITextField!
    @IBOutlet weak var lastLineReadTextField: UITextField!
    @IBOutlet weak var bookOrPdf: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        bookNameTextField.text = ""
        authorTextField.text = ""
        lastPageReadTextField.text = ""
        lastLineReadTextField.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { return }
        
        switch segueIdentifier {
        case "save":
            
            let book = Book()
            
            book.bookName = bookNameTextField.text ?? ""
            book.authorName = bookNameTextField.text ?? ""
            book.modificationTime = Date()

        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
