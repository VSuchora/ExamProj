//
//  Reminder.swift
//  ExamReminderApp
//
//  Created by Владимир Сухора on 20.10.22.
//

import Foundation
//Свойство id создано, чтобы идентифицировать конкретное напоминание, даже если его название или статус завершения меняется

struct Reminder: Equatable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}
//Расширение на Array, где элемент является напоминанием
extension Array where Element == Reminder {
    //Функция возвращает индекс определенного напоминания
    func indexOfReminder(with id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "Submit a project for review", dueDate: Date().addingTimeInterval(800.0), notes: "Don't forget about taxi receipts"),
        Reminder(title: "Am I a good programmer or just good at searching?", dueDate: Date().addingTimeInterval(14000.0), notes: "Who knows?", isComplete: true),
        Reminder(title: "How to pass the exam?", dueDate: Date().addingTimeInterval(24000.0), notes: "I don`t know. I`m Jhon Snow"),
        Reminder(title: "Gachi gym", dueDate: Date().addingTimeInterval(3200.0), notes: "New friends", isComplete: true)]
}
#endif


