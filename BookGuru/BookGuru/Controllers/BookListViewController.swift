//
//  BookListViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

class BookListViewController : UITableViewController{
    
    // - MAKR : Properties
    
    // Creates a dynamic array of type Bookt store each book's information
    var userBooks = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // - MARK : UITableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewControllerCell", for: indexPath) as! BookViewControllerCell
        //let book = userBooks[10]
        //cell.authorNameLabel.text = book.authorName
        //cell.modificationTimeLabel.text = book.modificationTime.dateToStringConversion()
        
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
            default :
                print("Unexpected Segue Identifier")
        }
    }

    @IBAction func unwindWithSegue(_ segue : UIStoryboardSegue){
        //empty at the moment
    }
    
    
}
