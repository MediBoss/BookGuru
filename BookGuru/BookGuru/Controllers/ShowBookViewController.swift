//
//  ShowBookViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//
import Foundation
import UIKit

/*
            ShowBookViewController
            **********************
 
 This view controller manages the settings, logics,
 logics, and segue when the user clicks on a specific
 book cell. Most of the UI is done on the storyboard,
 therefore Segue triggers and CoreData are handled here

 */



class ShowBookViewController : UIViewController{
   
    // - MARK : @IBOULETS
    
    @IBOutlet weak var bookNameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var lastPageReadTextField: UITextField!
    @IBOutlet weak var lastLineReadTextField: UITextField!
    @IBOutlet weak var bookOrPdf: UISegmentedControl!
    
   
    // - MARK : @IBACTIONS
    
    @IBAction func bookOrPdfIndexChanged(_ sender: Any) {
        let bookPreference = UserDefaults.standard
        let segmentControl: UISegmentedControl = sender as! UISegmentedControl
            
        switch segmentControl.selectedSegmentIndex{
            case 0:
                bookOrPdf.selectedSegmentIndex = 0
                bookPreference.set(true,forKey: "bookIsSelected")
                bookPreference.synchronize()
            case 1:
                bookOrPdf.selectedSegmentIndex = 1
                bookPreference.set(false, forKey: "bookIsSelected")
                bookPreference.synchronize()
            
            default:
                print("Invalid Segment Control Index")
        }
        
    }

    
    
    // - MARK : PROPERTIES
    
    var book : Book?
    
    
    // - MARK : VIEW CONTROLLER CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // - MARK : TEXTFIELDS DELEGATES
        self.title = book?.bookName
        self.bookNameTextField.delegate = self as UITextFieldDelegate
        self.authorTextField.delegate = self as UITextFieldDelegate
        self.lastPageReadTextField.delegate = self as UITextFieldDelegate
        self.lastLineReadTextField.delegate = self as UITextFieldDelegate
        
        // - MARK : USERDEFAULTS PERSISTANCE
        
        let bookTypePrefernce = UserDefaults.standard
        if let isBookSelected: Bool = bookTypePrefernce.value(forKey: "bookIsSelected") as! Bool? {
            if isBookSelected{
                self.bookOrPdf.selectedSegmentIndex = 0
            }else{
                self.bookOrPdf.selectedSegmentIndex = 1
            }
        }else{
            self.bookOrPdf.selectedSegmentIndex = 1
            bookTypePrefernce.set(false, forKey: "bookIsSelected")
            bookTypePrefernce.synchronize()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // if the book cell clicked already has an insteance created
        if let book = book{
            // the proper properties of the book instance are shown
            
            bookNameTextField.text = book.bookName
            authorTextField.text = book.authorName!
            lastPageReadTextField.text = book.lastPageRead.intToStringConverter()!
            lastLineReadTextField.text = book.lastLineRead.intToStringConverter()!
            book.bookOrPdf = bookOrPdf
            
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
      
        guard let segueIdentifier = segue.identifier else {return}
        switch segueIdentifier {
            
        case "save" where book != nil:
            
                book?.bookName = bookNameTextField.text ?? ""
                book?.authorName = authorTextField.text ?? ""
                book?.lastPageRead = (lastPageReadTextField.text?.stringToIntConverter(lastPageReadTextField.text))!
                book?.lastLineRead = (lastLineReadTextField.text?.stringToIntConverter(lastLineReadTextField.text))!
                book?.modificationTime = Date()
                CoreDataHelper.saveBook()
        
            // if the save button is taped when the text fields are empty
        case "save" where book == nil:
            
            let book = CoreDataHelper.createBook()
            book.authorName = authorTextField.text
            book.bookName = bookNameTextField.text
            // setting a default value to state that the user hasn't started reading the book
            book.lastPageRead = (lastPageReadTextField.text?.stringToIntConverter(lastPageReadTextField.text))!
            book.lastLineRead = (lastLineReadTextField.text?.stringToIntConverter(lastLineReadTextField.text))!
            book.modificationTime = Date()
            book.bookOrPdf = bookOrPdf
            
            CoreDataHelper.saveBook()
            
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
    
}
