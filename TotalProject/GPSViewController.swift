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
        
        //text를 빈칸으로 초기화
        MapInfo1.text = ""
        MapInfo2.text = ""
        
        loactionManager.delegate = self
        loactionManager.desiredAccuracy = kCLLocationAccuracyBest
        loactionManager.requestWhenInUseAuthorization()
        loactionManager.startUpdatingLocation()
        MapView.showsUserLocation = true
        
    }
    //위도 경도 원하는 위치 표시를 위해 goLocate 라는 함수를 사용
    func goLocate(latitude : CLLocationDegrees, longitude : CLLocationDegrees , delta span : Double) -> CLLocationCoordinate2D{
        let pLocate = CLLocationCoordinate2DMake(latitude, longitude)
        //위도와 경도값을 매개변수로 CLLocationCoordinate2DMake 함수를 호출 후 pLocate에 값을 저장 후 리턴
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        //MKCoordinateSpan을 이용하여 범위값을 매개변수 호출 후 spanValue에 저장 후 리턴
        let pRegion = MKCoordinateRegion(center: pLocate, span: spanValue)
        //pLocate와 spanValue값을 매개변수로 하여 MKCoordnateRegion 호출
        MapView.setRegion(pRegion, animated: true)
        //MapView.setRegion값을 저장하여 호출
        
        return pLocate
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        //위치가 업데이트 되면 먼저 마지막위치 값을 찾아낸다.
       _ = goLocate(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.01)
        //현재위치에 위도 경도를 goLocate 함수를 이용
        //delta -> 지도 확대
    
        CLGeocoder().reverseGeocodeLocation(lastLocation!) { (placemark, error) -> Void in
            let pm = placemark!.first
            let county = pm!.country
            var address:String = county!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            self.MapInfo1.text = "현재 위치"
            self.MapInfo2.text = address
        }//GPSView로 들어 왔을 때, 현재 위치를 보여주며 택스트를 변경하여 화면에 나타남
        loactionManager.stopUpdatingLocation()
    }
    
    //setPin는 해당 위치 위도,경도를 보여주는 역할
    func setPin(latitude : CLLocationDegrees , longitude : CLLocationDegrees , delta span : Double){
        let pin = MKPointAnnotation()
        pin.coordinate = goLocate(latitude: latitude, longitude: longitude, delta: span)
        MapView.addAnnotation(pin)
    }
    
    
    @IBOutlet weak var MapInfo1: UILabel!
    @IBOutlet weak var MapInfo2: UILabel!
    
    //상단에 위치를 눌렀을 시 나타나는 곳을 보여줌
    @IBAction func changeMap(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            MapInfo1.text = "보고 계신 위치" //세그먼트0을 눌렀을 때, 텍스트가 나오며 loactionManager.startUpdatingLocation() 위치를 보여줌
            MapInfo2.text = "현재 위치"
            loactionManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{ //세그먼트1을 눌렀을 때, 텍스트가 나오며 setPin을 통해 위도,경도를 받아 지도로 올린다.
            setPin(latitude: 37.500061, longitude: 126.86780, delta: 0.01)
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "동양 미래 대학교"
        }else if sender.selectedSegmentIndex == 2{
            setPin(latitude: 37.43876, longitude: 126.65904, delta: 0.01)
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "우리집"
        }else if sender.selectedSegmentIndex == 3{
            setPin(latitude: 33.450701, longitude: 126.570667, delta: 0.01)
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "나의 회사"
        }
    }
    

}
