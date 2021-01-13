//
//  Date+Extenstions.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 27.03.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import Foundation

extension Date {
    func weekDaysFromCurrentMonth() -> [String] {
        let calenSanzh = Calendar.current
        let startOfMonth = Date().startOfMonth
        let numberOfDays = calenSanzh.range(of: .day, in: .month, for: startOfMonth)!.upperBound
        let allDays = Array(0..<numberOfDays).map {
            calenSanzh.date(byAdding: .day, value: $0, to: startOfMonth)!
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "E dd"

        var formattedDates: [String] = []
        for day in allDays {
            let date = formatter.string(from: day)
            formattedDates.append(date)
        }

        return formattedDates
    }
    
    func dayOfMonth(_ count: Int = 1) -> Date? {
        let calenSanzh = Calendar.current
        return calenSanzh.date(byAdding: .month, value: count, to: self)
    }
    
    func nextBirthDay(_ since: Date = Date().startOfWeek ?? Date()) -> Date? {
        let calenSanzh = Calendar.current
        let components = calenSanzh.dateComponents([.day, .month], from: self)
        let nextDate = calenSanzh.nextDate(after: since, matching: components, matchingPolicy: .nextTimePreservingSmallerComponents)
        return nextDate
    }
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }

    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
    
    var startOfMonth: Date {
        let calenSanzh = Calendar.current
        let components = calenSanzh.dateComponents([.year, .month], from: self)
        return calenSanzh.date(from: components)!
    }
    
    var endOfMonth: Date {
        let calenSanzh = Calendar.current
        let startDate = self.startOfMonth
        let days = calenSanzh.range(of: .day, in: .month, for: self.startOfMonth)?.count ?? 0
        let firstDateOfNextMonth = calenSanzh.date(byAdding: .day, value: days, to: startDate)!
        return calenSanzh.date(byAdding: .day, value: -1, to: firstDateOfNextMonth)!
    }
}
