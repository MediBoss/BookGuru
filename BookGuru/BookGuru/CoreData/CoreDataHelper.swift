//
//  CoreDataHelper.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/4/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import CoreData
import UIKit

struct CoreDataHelper{

    
    /// This function persists the books data
    static func saveBookReference(){
        do{
            try context.save()
        }catch let error{
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    /// This function creates a new Book Data Model and returns the created book instance
    static func createBookReference() ->Book{
        
        let bookReference = NSEntityDescription.insertNewObject(forEntityName: "Book", into: context) as! Book
    }
    
    /// This function retrieves and return a list of all the Book instances created
    static func retriveBookReferences() -> [Book]{
        
        let fetchRequest = NSFetchRequest<Book>(entityName: "Book")
            do{
                let
            }
    }
 
}
