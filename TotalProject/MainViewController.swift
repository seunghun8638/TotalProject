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
        let profileBtn = self.storyboard?.instantiateViewController(identifier: "profileViewController") as? profileViewController
        profileBtn?.modalTransitionStyle = .coverVertical //화면 스타일
        self.present(profileBtn!, animated: true, completion: nil)
    }
    @IBAction func hobbyBtn(_ sender: Any) {
         let name = self.storyboard?.instantiateViewController(identifier: "favoriteControllerView") as? favoriteControllerView
        name?.modalTransitionStyle = .coverVertical
        self.present(name!, animated: true, completion: nil)
    }
    @IBAction func CalendarBtn(_ sender: Any) {
         let calendar  = self.storyboard?.instantiateViewController(identifier: "CalendarViewController") as? CalendarViewController
        calendar?.modalTransitionStyle = .coverVertical
        self.present(calendar!, animated: true, completion: nil)
    }
    @IBAction func WeatherBtn(_ sender: Any){
         let weather  = self.storyboard?.instantiateViewController(identifier: "GPSViewController") as? GPSViewController
        weather?.modalTransitionStyle = .coverVertical
        self.present(weather!, animated: true, completion: nil)
    }
    @IBAction func MusicBtn(_ sender: Any) {
         let music = self.storyboard?.instantiateViewController(identifier: "musicViewController") as? musicViewController
        music?.modalTransitionStyle = .coverVertical
        self.present(music!, animated: true, completion: nil)
    }
    @IBAction func memoBtn(_ sender: Any) {
        let memoBtn = self.storyboard?.instantiateViewController(identifier: "memoViewController") as? memoViewController
        memoBtn?.modalTransitionStyle = .flipHorizontal
       self.present(memoBtn!, animated: true, completion: nil)
    }
    
}
