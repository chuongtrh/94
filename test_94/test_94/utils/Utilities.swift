//
//  Utilities.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation

class Utilities {

    class func getWorkingDays(month:Int, year: Int) -> Int {

        //Ref: https://stackoverflow.com/questions/35601583/get-weekdays-within-a-month
        
        //Get the current calendar
        let calendar = Calendar.current
        
        
        //Get the month and year date components from the current date
        let dateComponents = DateComponents(year: year, month: month)
        
        //Get the date of the first day of the month
        let startOfMonth = calendar.date(from: dateComponents)!
        
        //Get the number of days for the current month
        let numberOfDays = calendar.range(of: .day, in: .month, for: startOfMonth)!.upperBound
        
        //Create an array of NSDate instances for every day in the current month
        let allDays = Array(0..<numberOfDays).map{ calendar.date(byAdding:.day, value: $0, to: startOfMonth)!}
        
        //Filter the days within a weekend
        let workDays = allDays.filter{ !calendar.isDateInWeekend($0) }
        return workDays.count
    }

}
