//
//  alertImage.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/30.
//

import UIKit

extension UIAlertController{
    func addImage(image : UIImage){
        var image = image

        let size = CGSize(width:  250 , height: 200) // 가로,세로 값을 지정
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height) //전체 뷰에 0,0위치에 가로/세로 길이를 지정하여 사각형 만듬
    
        //사진 크기 재 정의
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        image.draw(in: rect)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        //시용지기 클릭 했을 시, 아무것도 할 수 없게 하는 것
        imgAction.isEnabled = false
        //image.withRenderingMode -> 항상 원본으로 보이게끔 설정
        imgAction.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "Img")
        self.addAction(imgAction)
    }
}
