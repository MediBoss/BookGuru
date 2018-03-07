//
//  String+Int.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/1/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//



import Foundation
import UIKit

/*Extending the String Type with a string method
 stringToIntConverter to convert a UILabel text to an int
 when storing that value into an int class variable
 */
extension String{
    func stringToIntConverter(_ str : String?) -> Int16?{
        guard let stringToBeInt = str else{
           return nil
        }
        return Int16(stringToBeInt)
    }
}

/*
 Extending the Int16 type with he intToStringConverter
 to convert an int to a string when filling up a
 UILabel.text
 */
extension Int16{
    func intToStringConverter() -> String?{
    
        return String(self)
    }
}

