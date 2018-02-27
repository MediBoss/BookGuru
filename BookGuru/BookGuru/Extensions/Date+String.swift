//
//  Date+String.swift
//  BookGuru
//
//  Created by Assumani, Medi on 2/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation

extension Date{
    func dateToStringConversion() -> String{
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
    func dateToStringConversion() -> String{
        
    }
}
