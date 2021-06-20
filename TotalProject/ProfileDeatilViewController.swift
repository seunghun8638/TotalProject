//
//  ProfileDeatilViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/22.
//

import UIKit

class ProfileDeatilViewController: UIViewController {

    @IBOutlet weak var write1: UILabel!
    @IBOutlet weak var write2: UILabel!
    @IBOutlet weak var write3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layer(write1)
        layer(write2)
        layer(write3)
    }
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // 테두리 및 테두리 색 지정
    func layer(_ name : UILabel){
        name.layer.borderWidth = 0.2
        name.layer.borderColor = UIColor.black.cgColor
    }
}
