//
//  Date+String.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation

// Extending the Date Type functionality to be able to convert date format to string style
extension Date{
    func dateToStringConversion() -> String{
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
        
  }

// Extending the NSDate Type functionality to be able to convert date format to string style

extension NSDate{
    func dateToStringconversion() -> String{
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

