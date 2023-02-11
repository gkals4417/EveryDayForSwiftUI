//
//  CalendarView.swift
//  EveryDayForSwiftUI
//
//  Created by Hamin Jeong on 2023/02/10.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedData.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<SavedData>
    
    typealias UIViewType = FSCalendar
    
    @Binding var selectedData: Date? {
        didSet {
            print(selectedData)
        }
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.backgroundColor = .white
//        calendar.appearance.titleFont = UIFont(name: "BMHANNAAir", size: 15)
//        calendar.appearance.weekdayFont = UIFont(name: "BMHANNAAir", size: 15)
//        calendar.appearance.subtitleFont = UIFont(name: "BMHANNAAir", size: 10)
//        calendar.appearance.headerTitleFont = UIFont(name: "BMHANNAAir", size: 20)
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.subtitleTodayColor = .black
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.selectionColor = UIColor(red: 78/255, green: 120/255, blue: 246/255, alpha: 1.0)
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.titleWeekendColor = .red
        calendar.appearance.todayColor = .white
        calendar.appearance.eventDefaultColor = UIColor(red: 78/255, green: 120/255, blue: 246/255, alpha: 1.0)
        calendar.appearance.eventSelectionColor = UIColor(red: 78/255, green: 120/255, blue: 246/255, alpha: 1.0)
        calendar.appearance.borderRadius = 0.5
        calendar.swipeToChooseGesture.isEnabled = true
        
        calendar.calendarWeekdayView.weekdayLabels[0].textColor = .red
        calendar.calendarWeekdayView.weekdayLabels[1].textColor = .black
        calendar.calendarWeekdayView.weekdayLabels[2].textColor = .black
        calendar.calendarWeekdayView.weekdayLabels[3].textColor = .black
        calendar.calendarWeekdayView.weekdayLabels[4].textColor = .black
        calendar.calendarWeekdayView.weekdayLabels[5].textColor = .black
        calendar.calendarWeekdayView.weekdayLabels[6].textColor = .red
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {}
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarView
        
        init(parent: CalendarView) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
            let today = Date()
                var temp = ""
                if today.formatted(date: .numeric, time: .omitted) == date.formatted(date: .numeric, time: .omitted){
                    temp = "오늘"
                }
                return temp
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedData = date
        }
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: CalendarView(selectedData: $selectedData))
    }
}
