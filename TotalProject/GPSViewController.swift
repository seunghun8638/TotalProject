//
//  WeatherViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/20.
//

import UIKit
import MapKit

class GPSViewController: UIViewController,CLLocationManagerDelegate{
    

    let loactionManager = CLLocationManager()
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapInfo1.text = "맵정보1"
        MapInfo2.text = "맵정보2"
        
        loactionManager.delegate = self
        loactionManager.desiredAccuracy = kCLLocationAccuracyBest
        loactionManager.requestWhenInUseAuthorization()
        loactionManager.startUpdatingLocation()
        MapView.showsUserLocation = true
        
    }

    

    @IBOutlet weak var MapInfo1: UILabel!
    @IBOutlet weak var MapInfo2: UILabel!
    
    @IBAction func changeMap(_ sender: UISegmentedControl) {
    }
    

}
