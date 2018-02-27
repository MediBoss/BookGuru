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
    
    // Creates a dynamic array of type bookto store each book's information
    var userBooks = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // - MARK : UITableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return userBooks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewControllerCell", for: indexPath) as! BookViewControllerCell
        let book = userBooks[indexPath.row]
        cell.authorNameLabel.text = book.authorName
        cell.modificationTimeLabel.text = book.modificationTime.dateToStringConversion()
        
        return cell
    }
    
    
}
