//
//  hobbyDetailView.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/15.
//

import UIKit

class favoriteDetailView: UIViewController {

    //favoriteControllerView에서 넘겨주는 정보를 저장하기 위해 사용하는 변수
    var number : Int?
    var name : String?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var numberText: UILabel!
    @IBOutlet var nameText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
    //받아온 정보를 저장하여 label 과 imageView에 정보 넘겨줘 보여줌
    func update(){
        if let name = self.name , let number = self.number{
            nameText.text = name
            numberText.text = "\(number)"
            imgView.image = UIImage(named: "\(name).jpg")
        }
        
    }
}
