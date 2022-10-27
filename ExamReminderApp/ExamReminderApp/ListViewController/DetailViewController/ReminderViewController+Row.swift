//
//  ReminderViewController+Row.swift
//  ExamReminderApp
//
//  Created by Владимир Сухора on 22.10.22.
//

import UIKit

extension ReminderViewController {
    enum Row: Hashable {
        case header(String)
        case viewDate
        case viewNotes
        case viewTime
        case viewTitle
        case editText(String?)
        case editDate(Date)
        
        var imageName: String? {
            switch self {
            case .viewDate:
                return "calendar"
            case .viewNotes:
                return "square.and.pencil"
            case .viewTime:
                return "clock"
            default:
                return nil
            }
        }
        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let configuratin = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuratin)
        }
        var textStyle: UIFont.TextStyle {
            switch self {
            case .viewTitle:
                return .headline
            default:
                return .subheadline
            }
        }
    }
}
