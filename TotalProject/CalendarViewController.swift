//
//  CalendarViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/18.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource{
    
    @IBOutlet weak var calendar: FSCalendar!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollDirection = .vertical
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.selectionColor = UIColor.blue
        calendar.appearance.todayColor = UIColor.orange
        calendar.appearance.todaySelectionColor = UIColor.black
        
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0

        calendar.appearance.headerDateFormat = "YYYY년 M월"


        calendar.locale = Locale(identifier: "ko_KR")
                
        calendar.calendarWeekdayView.weekdayLabels[0].text = "일"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "월"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "화"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "수"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "목"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "금"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "토"
        
        calendar.appearance.subtitleSelectionColor = .black
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        dateFormatter.dateFormat = "YYYY-MM-dd"
               print(dateFormatter.string(from: date))

        
    }

    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case "2021-04-11":
            return "출근"
        case "2021-04-12":
            return "지각"
        case "2021-04-13":
            return "결근"
        default:
            return nil
        }
    }

    
    @IBAction func plusBtn(_ sender: Any) {
        

}
}

