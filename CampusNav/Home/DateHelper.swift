//
//  DateHelper.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import Foundation

struct DateHelper {
    
    // get the current month and day
    static var currentMonthAndDay: String {
        let date = Date()
        
        let dateFormatter = DateFormatter() // format the month and day -> into a string :D
        dateFormatter.dateFormat = "MMMM dd"
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
    
    static var currentDayOfWeek: String {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
}
