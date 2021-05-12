//
//  CalendarViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/18.
//

import UIKit
import FSCalendar

//FSCalendar 이용하여 달력 이용

class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource{
    
    @IBOutlet weak var calendar: FSCalendar!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollDirection = .vertical
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        //color 변경 소스
        calendar.appearance.headerTitleColor = UIColor.black
        calendar.appearance.selectionColor = UIColor.blue
        calendar.appearance.todayColor = UIColor.orange
        calendar.appearance.todaySelectionColor = UIColor.black
        
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0

        calendar.appearance.headerDateFormat = "YYYY년 M월" // -> 상단 커스텀하여 영어를 한글로 변경


        calendar.locale = Locale(identifier: "ko_KR")
                
        //calendar 요일 표시를 영어에서 한글로 변경
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

    //calendar위에 정보를 입력
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case "2021-05-11":
            return "운동"
        case "2021-05-12":
            return "지각"
        case "2021-05-13":
            return "저장"
        default:
            return nil
        }
    }
}

