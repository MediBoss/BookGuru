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
    
    
    // - MARK : VIEW CONTROLLER CYCLES METHODS
    
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
    

    // - MARK : SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { return }
        
        switch segueIdentifier {
        case "save":
            
            let book = Book()
            
                //Initializing each book property
            book.bookName = bookNameTextField.text ?? ""
            book.authorName = authorTextField.text ?? ""
            book.lastPageRead = (lastPageReadTextField.text?.stringToIntConverter())!
            book.lastLineRead = (lastLineReadTextField.text?.stringToIntConverter())!
            book.modificationTime = Date()
            
// if the user selects pdf as the book format, the pdf image will be displayed on the cell
                if bookOrPdf.selectedSegmentIndex == 0{
                    book.bookImage = UIImage(named : "book")
                }else if bookOrPdf.selectedSegmentIndex == 1{
                    book.bookImage = UIImage(named : "pdf2")
            }
            
                //transfering data from one view controller to another
            
            let destination = segue.destination as! BookListViewController
            destination.userBooks.append(book)
            
           

        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    // - MARK : KEYBOARD EVENTS
    
    
    // This function dismiss keybpard when user tap on the background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // This funnction dismiss the keyboard when the user clicks "retunr"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        bookNameTextField.resignFirstResponder()
        authorTextField.resignFirstResponder()
        lastPageReadTextField.resignFirstResponder()
        lastLineReadTextField.resignFirstResponder()
        
        return true
    }
    
    
    
}
