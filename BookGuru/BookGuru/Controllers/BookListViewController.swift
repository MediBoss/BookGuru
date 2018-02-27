//
//  BookListViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

class BookListViewController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // - MARK : UITableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookViewControllerCell", for: indexPath) as! BookViewControllerCell
        
        return cell
    }
    
    
}
