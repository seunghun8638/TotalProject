//
//  CalendarViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/18.
//

import UIKit
import FSCalendar
import RealmSwift

//FSCalendar 이용하여 달력 이용

class calendarInfo:Object {
    @objc dynamic var date = "2021-05-03"
    @objc dynamic var content = "테스트"
}
class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource{
    var realm : Realm!
    
    @IBOutlet weak var calendar: FSCalendar!
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        print(realm.objects(calendarInfo.self))
        
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
//        dateFormatter.dateFormat = "YYYY-MM-dd"
//        let dataString = self.dateFormatter.string(from:date)
//        print(dataString)
        guard let data = self.storyboard?.instantiateViewController(identifier: "calendarAddViewController") as? calendarAddViewController else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        data.dateText = dateFormatter.string(from: date)
        self.present(data, animated: true, completion: nil)
    }
    
    @IBAction func reloadBtn(_ sender: Any) {
        realm = try! Realm()
        calendar.reloadData()
        print("reload")
        print(realm.objects(calendarInfo.self))
    }

    @IBAction func deleteBtn(_ sender: Any) {
        realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
        }
    }
    //calendar위에 정보를 입력
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        let item = realm.objects(calendarInfo.self)
        if item.count == 0{
            return nil
        }
        else if item.count != 0{
                for i in 0...item.count {
                    switch dateFormatter.string(from: date) {
                    case item[i].date:
                        return item[i].content
                    case item[i+1].date:
                        return item[i+1].content
                    default:
                        return nil
                }
            }
        }
        return nil

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        calendar.reloadData()
        print("reload")
        
    }
}
