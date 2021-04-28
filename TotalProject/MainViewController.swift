//
//  MainViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/14.
//

import UIKit

class MainViewController: UIViewController,UITabBarControllerDelegate{

    @IBOutlet weak var HelloLabel: UILabel!
    
    var helloText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main View"
        self.navigationItem.backButtonTitle = "Back"
        
        HelloLabel.text = "Hello! "
    
    }

 
    
    @IBAction func profileBtn(_ sender: Any) {
        let profileBtn = self.storyboard?.instantiateViewController(identifier: "profileViewController") as? profileViewController
        profileBtn?.modalTransitionStyle = .coverVertical
        self.present(profileBtn!, animated: true, completion: nil)
    }
    @IBAction func hobbyBtn(_ sender: Any) {
         let name = self.storyboard?.instantiateViewController(identifier: "hobbyControllerView") as? hobbyControllerView
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
    
}
