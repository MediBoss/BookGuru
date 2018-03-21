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

class BookListViewController : UITableViewController{
    // - MAKRK : Properties
    
    // Creates a dynamic array of type Book store each book's information
    var userBooks = [Book](){
        didSet {
            // if a book is added or removed, the tableview updates
            tableView.reloadData()
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        userBooks = CoreDataHelper.retrieveBooks()
    }
    
    // - MARK : UITableView Data Source Methods
    
    // This function returns the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return userBooks.count
    }
    
    // This Function populates the each cell accordingly
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewControllerCell", for: indexPath) as! BookViewControllerCell
        let book = userBooks[indexPath.row]
        cell.bookName.text = book.bookName
        cell.modificationTimeLabel.text = book.modificationTime?.dateToStringConversion()
        return cell
    }


    // This function removes the book from the tableview if selected
    override func tableView(_ tableview : UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let bookToBeDeleted = userBooks[indexPath.row]
            CoreDataHelper.delete(bookToBeDeleted)
            userBooks = CoreDataHelper.retrieveBooks()
        }
    }
 
    // - MARK : SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {return}
        
        switch identifier{
            
            case "displayBook":
                guard let indextPath = tableView.indexPathForSelectedRow else {return}
                let book = userBooks[indextPath.row]
                let destination = segue.destination as! ShowBookViewController
                destination.book = book
            
            case "addBook" :
                print("creating new book")
            default :
                print("Unexpected Segue Identifier")
        }
    }

    // This Function handles the pop segue to avoid memory leaks by using an unwind segue
    @IBAction func unwindWithSegue(_ segue : UIStoryboardSegue){
            userBooks = CoreDataHelper.retrieveBooks()
    }
}
