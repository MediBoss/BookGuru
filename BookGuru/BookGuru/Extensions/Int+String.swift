//
//  Int+String.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/1/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//



import Foundation


// Extending the Int type so i can convert a number in a string format into an Int format
extension Int{
    func stringToIntConverter(_ string : String) -> Int{
        return Int(string)!
    }
}
