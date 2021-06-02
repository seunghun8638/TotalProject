//
//  MainViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/14.
//

import UIKit

class MainViewController: UIViewController,UITabBarControllerDelegate{

    @IBOutlet weak var HelloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 앱 처음 화면 상단 문구
        HelloLabel.text = "Hello!"
        
    }

 //버튼 클릭 동작으로 화면 전환 동작
    @IBAction func profileBtn(_ sender: Any) {
        btnView("profileBtn", "profileViewController")
    }
    @IBAction func hobbyBtn(_ sender: Any) {
        btnView("favorite", "favoriteControllerView")
    }
    @IBAction func CalendarBtn(_ sender: Any) {
        btnView("calendar", "CalendarViewController")
    }
    @IBAction func WeatherBtn(_ sender: Any){
        btnView("map", "GPSViewController")
    }
    @IBAction func MusicBtn(_ sender: Any) {
        btnView("play", "musicViewController")
    }
    @IBAction func memoBtn(_ sender: Any) {
        btnView("play", "memoViewController")
    }
}


extension MainViewController {
    func btnView(_ btn : String, _ name : String){
        let btn = self.storyboard?.instantiateViewController(identifier: name)
        btn?.modalTransitionStyle = .coverVertical
        self.present(btn!, animated: true, completion: nil)
    }
}
