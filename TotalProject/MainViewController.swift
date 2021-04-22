//
//  MainViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/14.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var HelloLabel: UILabel!
    
    var helloText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main View"
        self.navigationItem.backButtonTitle = "Back"
        
        HelloLabel.text = "Hello! \(helloText!)"
        
    }    
    
    @IBAction func profileBtn(_ sender: Any) {
        guard let profileBtn = self.storyboard?.instantiateViewController(identifier: "profileViewController") as? profileViewController else {return}
        self.navigationController?.pushViewController(profileBtn, animated: true)
    }
    @IBAction func hobbyBtn(_ sender: Any) {
        guard let name = self.storyboard?.instantiateViewController(identifier: "hobbyControllerView") as? hobbyControllerView else {return}
        self.navigationController?.pushViewController(name, animated: true)
    }
    @IBAction func CalendarBtn(_ sender: Any) {
        guard let calendar  = self.storyboard?.instantiateViewController(identifier: "CalendarViewController") as? CalendarViewController else {return}
        self.navigationController?.pushViewController(calendar, animated: true)
    }
    @IBAction func WeatherBtn(_ sender: Any){
        guard let weather  = self.storyboard?.instantiateViewController(identifier: "GPSViewController") as? GPSViewController else {return}
        self.navigationController?.pushViewController(weather, animated: true)
    }
    @IBAction func MusicBtn(_ sender: Any) {
        guard let music = self.storyboard?.instantiateViewController(identifier: "MusicViewController") as? MusicViewController else{return}
        self.navigationController?.pushViewController(music, animated: true)
    }
    
}


