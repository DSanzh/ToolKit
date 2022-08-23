//
//  String+Extenstions.swift
//  ToolKit
//
//  Created by Санжар Дауылов on 27.04.2020.
//  Copyright © 2020 D. Sanzhar. All rights reserved.
//

import UIKit

extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }
    func applicationVersion() -> String {
        let appVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")
        return appVersion
    }
    func appAndBuildVersion() -> String {
        let buildNumber = buildVersion()
        let appVersion = applicationVersion()
        let result = appVersion + "(" + buildNumber + ")"
        return result
    }
    
    func buildVersion() -> String {
        let buildNumber = (Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "")
        return buildNumber
    }
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


enum DateFormat: String {
    /// Format: yyyy-MM-dd
    case withoutTimeDush = "yyyy-MM-dd"
    /// Format: yyyy-MM-dd HH:mm:ss
    case withTimeDush = "yyyy-MM-dd HH:mm:ss"
    /// Format: dd.MM.yyyy
    case withoutTimeDot =  "dd.MM.yyyy"
    /// Format: dd.MM.yyyy HH:mm
    case withTimeDot =  "dd.MM.yyyy HH:mm"
    /// Format: dd MMMM yyyy
    case dd_month_yyyy = "dd MMMM yyyy"
    /// Format: LLLL yyyy
    case month_yyyy = "LLLL yyyy"
    /// Format: yyyy-MM
    case month = "yyyy-MM"
    /// Format: MMMM
    case onlyMonth = "MMMM"
    /// Format: yyyy
    case year = "yyyy"
    /// Format: yyyy-MM-dd'T'HH:mm:ssZ
    case fullWithTimeZone = "yyyy-MM-dd'T'HH:mm:ssZ"
    /// Format: yyyy-MM-dd'T'HH:mm:ss
    case full = "yyyy-MM-dd'T'HH:mm:ss"
    /// Format: yyyy-MM-dd'T'HH:mm:ss.SSS
    case fullWithMiliseconds = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    /// Format: dd MMMM
    case dayMonthly = "dd MMMM"
}


extension String {
    func dateString(withFormat: DateFormat, toFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: AppLangWorker().getLocale())
        dateFormatter.dateFormat = withFormat.rawValue
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat.rawValue
            let newSt = dateFormatter.string(from: date)
            return newSt
        }
        return self
    }
}

extension String {
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(from number: Int) -> String {
        return self[min(number, count) ..< count]
    }

    func substring(to number: Int) -> String {
        return self[0 ..< max(0, number)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String {
    func parse<D>(to type: D.Type) -> D? where D: Decodable {
        let data: Data = self.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let _object = try decoder.decode(type, from: data)
            return _object
        } catch {
            return nil
        }
    }
}
