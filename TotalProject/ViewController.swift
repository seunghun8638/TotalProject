//
//  ViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SendBtn(_ sender: Any) {

        guard let name = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
        self.navigationController?.pushViewController(name, animated: true)
        name.helloText = nameLabel.text!
    }


    
}

