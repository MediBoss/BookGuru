//
//  String+Int.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/1/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//



import Foundation

/*Extending the String Type with a string method
 stringToIntConverter to convert a UILabel text to an int
 when storing that value into an int class variable
 */
extension String{
    func stringToIntConverter() -> Int{
        return (Int(self))!
    }
}

/*
 Extending the Int type with he intToStringConverter
 to convert an int to a string when filling up a
 UILabel.text
 */
extension Int{
    func intToStringConverter() -> String{
        return (String(self))
    }
}

