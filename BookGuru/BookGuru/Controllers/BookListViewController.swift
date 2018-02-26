//
//  BookListViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/26/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit
import CoreData

class BookListViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // - MARK : UITableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListTableViewCell", for: indexPath)
        
        return cell
    }
 
}
