//
//  CoreDataHelper.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/4/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHelper{
    
    static let objectContext: NSManagedObjectContext = {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            
            fatalError()
        }
                //Accesing the NSPersistentContainer from the CoreData Stack located in the AppDelegate.swift
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    // - MARK : METHODS

    //Function to create a book reference
    static func createBook() -> Book{
        let book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: objectContext) as! Book
        return book
    }
    
    // Function to save and persist the book reference using Coredata
    static func saveBook(){
        do{
            try objectContext.save()
            
        }catch let errorFound{
            print("Could not save \(errorFound.localizedDescription)")
        }
    }
    
    // Function to delete a book reference from the array
    static func delete(_ bookToDelete : Book){
        objectContext.delete(bookToDelete)
        saveBook()
    }
    
    // Function to fetch and retrieve the user's book references
    static func retrieveBooks() -> [Book]{
        
        do{
        
        let fetchRequest = NSFetchRequest<Book>(entityName: "Book")
        let fetchResults = try objectContext.fetch(fetchRequest)
        
        return fetchResults
            
        }catch let errorFound{
            print("Could not Fetch \(errorFound.localizedDescription)")
        }
        
        return []
    }
 
}

