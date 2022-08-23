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
    /// To get local date by getting a current TimeZone
    /// - Returns: Date
    var localDate: Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else { return Date() }

        return localDate
    }
    
    func dateTimeChangeFormat(str stringWithDate: String, inDateFormat: String, outDateFormat: String) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = inDateFormat

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = outDateFormat

        let inStr = stringWithDate
        let date = inFormatter.date(from: inStr)!
        return outFormatter.string(from: date)
    }
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
extension Date {

    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }

    func isInSameDay(as date: Date) -> Bool { Calendar.current.isDate(self, inSameDayAs: date) }

    var isInThisYear:  Bool { isInSameYear(as: Date()) }
    var isInThisMonth: Bool { isInSameMonth(as: Date()) }
    var isInThisWeek:  Bool { isInSameWeek(as: Date()) }

    var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isInToday:     Bool { Calendar.current.isDateInToday(self) }
    var isInTomorrow:  Bool { Calendar.current.isDateInTomorrow(self) }

    var isInTheFuture: Bool { self > Date() }
    var isInThePast:   Bool { self < Date() }
}
