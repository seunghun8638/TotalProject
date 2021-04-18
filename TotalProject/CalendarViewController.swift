//
//  CalendarViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/18.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController,FSCalendarDelegate {
    
    @IBOutlet var calender : FSCalendar!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        calender.delegate = self
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYY"
        let string = formatter.string(from: date)
        print("\(string)")
    }
}
