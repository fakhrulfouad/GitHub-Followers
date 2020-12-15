//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 14/12/2020.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyy"
        return dateFormatter.string(from: self)
    }
    
}
