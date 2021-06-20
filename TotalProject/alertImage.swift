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
        
        let size = CGSize(width:  250 , height: 200)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        image.draw(in: rect)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
    }
}
