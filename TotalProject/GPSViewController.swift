//
//  WeatherViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/20.
//

import UIKit
import MapKit

class GPSViewController: UIViewController,CLLocationManagerDelegate{
    
    //위치 정보와 관련된 이벤트를 처리하는 역할
    let loactionManager = CLLocationManager()
    
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text를 빈칸으로 초기화
        MapInfo1.text = ""
        MapInfo2.text = ""
        loactionManager.delegate = self
        // 위치 정확도를 최고로 높히기 주기 위함
        loactionManager.desiredAccuracy = kCLLocationAccuracyBest
        // 사용자에게 GPS 허용 알림
        loactionManager.requestWhenInUseAuthorization()
        // 위치 업데이트 시작
        loactionManager.startUpdatingLocation()
        // 맵뷰에 자기 위치 보이게 하기
        MapView.showsUserLocation = true
        
    }
    //위도 경도 원하는 위치 표시를 위해 mylocate 라는 함수를 사용
    func mylocate(latitude : CLLocationDegrees, longitude : CLLocationDegrees , span : Double) -> CLLocationCoordinate2D{
        //위도와 경도값 저장하여 가지고 있음
        let locate = CLLocationCoordinate2DMake(latitude, longitude) 
        
        //보여지는 지도 영역(크기)를 span값으로 지정 후 spanSize에 저장
        let spanSize = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)

        //특정 지역을 나타내는 locate값(위도,경도)와 보여지는 지도 크기 값을 저장
        let pRegion = MKCoordinateRegion(center: locate, span: spanSize)
        
        //setRegion함수는 지도에 지역을 서정하여 사용자 위치 업데이트
        MapView.setRegion(pRegion, animated: true)
     
        //return하는 이유는 위도와 경도의 포맷을 지정해주는 객체를 반환하기 위해
        return locate
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //마지막 위치의 위도 / 경도를 사용 하기 위해 마지막 위치를 저장함
        let lastLocation = locations.last
     
        // mylocate함수에 위도와 경도는 locations.last안에 값을 사용 , span은 지정해서 화면에 보여줌
        mylocate(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, span: 0.01)
        
        //맨 처음 진입 시, 나타나는 텍스트
        self.MapInfo1.text = "보고 계신 위치"
        self.MapInfo2.text = "현재 위치"
        
        //locations.last를 위해 현재 위치 서비스 중지
        loactionManager.stopUpdatingLocation()
    }
    
    //setPin는 해당 위치 위도,경도를 보여주는 역할
    func setPin(latitude : CLLocationDegrees , longitude : CLLocationDegrees , span : Double){
        
        //pin은 지도위에 표시해주기 위해 MKPointAnnotation함수를 하용
        let pin = MKPointAnnotation()
        pin.coordinate = mylocate(latitude: latitude, longitude: longitude, span: span)
        MapView.addAnnotation(pin)
    }
    
    
    @IBOutlet weak var MapInfo1: UILabel!
    @IBOutlet weak var MapInfo2: UILabel!
    
    //상단에 위치를 눌렀을 시 나타나는 곳을 보여줌
    @IBAction func changeMap(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "현재 위치"
            //현재 위치를 나타내기 위해 현재 위치 업데이트 시작
            loactionManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{ //세그먼트1을 눌렀을 때, 텍스트가 나오며 setPin을 통해 위도,경도를 받아 지도로 올린다.
            setPin(latitude: 37.500061, longitude: 126.86780, span: 0.01)
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "동양 미래 대학교"
        }else if sender.selectedSegmentIndex == 2{
            setPin(latitude: 37.43876, longitude: 126.65904, span: 0.01)
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "우리집"
        }else if sender.selectedSegmentIndex == 3{
            setPin(latitude: 33.450701, longitude: 126.570667, span: 0.01)
            MapInfo1.text = "보고 계신 위치"
            MapInfo2.text = "나의 회사"
        }
    }
}

