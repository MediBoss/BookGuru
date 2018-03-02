//
//  BookListViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

/*
                BookListViewController
                **********************
 
 This View controller manages the app's home page that is
 made up of TableViewCells of the UITableViewController
 class. It implements important DataSource methods, keep
 tracks of secgues triggers, and Data Persistence between
 App Lunches using the CoreData Framework.
 */



import UIKit
import CoreData

class BookListViewController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // - MAKR : Properties
    
    // Creates a dynamic array of type Bookt store each book's information
    var userBooks = [Book]()
    
    
    // - MARK : UITableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewControllerCell", for: indexPath) as! BookViewControllerCell
        let book = userBooks[indexPath.row]
        cell.bookName.text = book.bookName
        cell.modificationTimeLabel.text = book.modificationTime.dateToStringConversion()
        
        return cell
    }
    
    // - MARK : SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {return}
        
        switch identifier{
            case "displayBook":
                print("switching to Show Book VC")
            case "addBook" :
                print("creating new book")
            case "preferences":
                print("switching to show Preferences VC")
            default :
                print("Unexpected Segue Identifier")
        }
    }

    
    // This Function handles the pop segue to avoid memory leaks by using an unwind segue
    @IBAction func unwindWithSegue(_ segue : UIStoryboardSegue){
        //empty at the moment
    }
    
    
}
