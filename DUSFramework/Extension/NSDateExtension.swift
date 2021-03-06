//
//  File.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import Foundation

extension NSDate {
    
    func day() -> Int {
        let components = NSCalendar.currentCalendar().component(NSCalendarUnit.Day, fromDate: self)

        return components
    }
    
    func month() -> Int {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Month, fromDate: self)
        return components.month
    }
    
    func year() -> Int {
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: self)
        return components.year
    }
    
    func IsBetween(beginDate: NSDate, endDate:NSDate) -> Bool {
        var isBetween = false
        
        if (self.compare(beginDate) == NSComparisonResult.OrderedDescending &&
            self.compare(endDate) == NSComparisonResult.OrderedAscending) {
            isBetween = true;
        }   
        return isBetween
    }
 
    // MARK: Class/Static Methods

    class func dateFromActualYear(day: Int, month: Int) -> NSDate {
        let dateWithActualYear = NSDate.date(day, month: month, year: NSDate().year())
        return dateWithActualYear
    }
    
    class func date(day: Int, month: Int, year: Int) -> NSDate {
        let dateComponent = NSDateComponents();
        dateComponent.day = day
        dateComponent.month = month
        dateComponent.year = year
        
        let date = NSCalendar.currentCalendar().dateFromComponents(dateComponent)
        return date!
    }
    
    class func numberOfDaysBetweenDates(fromDate: NSDate, toDate: NSDate) -> Int{
        let components = NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: fromDate, toDate: toDate, options: NSCalendarOptions())
        return components.day
    }
}