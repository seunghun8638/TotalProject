//
//  memoDeatilViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/19.
//

import UIKit

class memoDeatilViewController: UIViewController {

    var Atitle : String?
    var AContent : String?
    
    @IBOutlet var loadTitel: UILabel!
    @IBOutlet var loadContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //메모 제목 및 내용 불러와서 title 및 content에 넣기
    func update(){
        self.loadTitel.text = Atitle!
        self.loadContent.text = AContent!
    }
}
