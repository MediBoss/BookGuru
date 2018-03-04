//
//  String+Int.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/1/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//



import Foundation
/*Extending the String Type with astring method
 stringToIntConverte to convert a uilabel text
 to an int
 */
extension String{
    func stringToIntConverter() -> Int{
        return (Int(self))!
    }
}

