//
//  ReminderListStyle.swift
//  ExamReminderApp
//
//  Created by Владимир Сухора on 25.10.22.
//

import Foundation

enum ReminderListStyle: Int {
    case today
    case scheduled
    case all
    
    var name: String {
        switch self {
        case .today:
            return NSLocalizedString("Today", comment: "Today style name")
        case .scheduled:
            return NSLocalizedString("Scheduled", comment: "Scheduled style name")
        case .all:
            return NSLocalizedString("All", comment: "All style name")
        }
    }
    
    func shouldInclude(date: Date) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .today:
            return isInToday
        case .scheduled:
            return (date > Date.now) && !isInToday
        case .all:
            return true
        }
    }
}
