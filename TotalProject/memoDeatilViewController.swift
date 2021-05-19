//
//  memoDeatilViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/19.
//

import UIKit

class memoDeatilViewController: UIViewController {

    var text : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var textLabel: UILabel!
    

    func update(){
        if let text = self.text{
            textLabel.text = text
        }
        
    }

}
