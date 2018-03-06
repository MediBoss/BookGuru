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
    
    
    // - MARK : PROPERTIES
    
    var book : Book?
    
    // - MARK : VIEW CONTROLLER CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // if the book cell clicked already has an insteance created
        if let book = book{
            // the proper properties of the book instance are shown
            
            bookNameTextField.text = book.bookName
            authorTextField.text = book.authorName
            lastPageReadTextField.text = book.lastPageRead?.intToStringConverter()
            lastLineReadTextField.text = book.lastLineRead?.intToStringConverter()
            
            // if there are no instance created corresponding the clicked book cell
        }else{
                // The text field are empty
            bookNameTextField.text = ""
            authorTextField.text = ""
            lastPageReadTextField.text = ""
            lastLineReadTextField.text = ""
        }
     
    }
    

    // - MARK : SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        guard let segueIdentifier = segue.identifier,
              let segueDestination = segue.destination as? BookListViewController else {return}
        
        switch segueIdentifier {
            
        case "save" where book != nil:
            
        // The chain of statements below updates the book refernce with the new data after the "save" button is taped
            
                book?.bookName = bookNameTextField.text ?? ""
                book?.authorName = authorTextField.text ?? ""
                book?.lastPageRead = lastPageReadTextField.text?.stringToIntConverter()
                book?.lastLineRead = lastLineReadTextField.text?.stringToIntConverter()
                book?.modificationTime = Date()
                book?.checkUiSegmentedPicked(bookOrPdf)
                
        
                segueDestination.tableView.reloadData()
        
            // if the save button is taped when the text fields are empty
        case "save" where book == nil:
            
            let book = Book()
            book.authorName = authorTextField.text ?? ""
            book.bookName = bookNameTextField.text ?? ""
            book.lastPageRead = lastPageReadTextField.text?.stringToIntConverter()
            book.lastLineRead = lastLineReadTextField.text?.stringToIntConverter()
            book.modificationTime = Date()
            book.checkUiSegmentedPicked(bookOrPdf)
            
            segueDestination.userBooks.append(book)
            
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
