//
//  hobbyDetailView.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/15.
//

import UIKit

class favoriteDetailView: UIViewController {

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
   
    
    func update(){
        if let name = self.name , let number = self.number{
            nameText.text = name
            numberText.text = "\(number)"
            imgView.image = UIImage(named: "\(name).jpg")
        }
        
    }
}
