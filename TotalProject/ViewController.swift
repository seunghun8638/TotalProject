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
        self.navigationItem.title = "Basis View"
        self.navigationItem.backButtonTitle = "Back"
    }

    @IBAction func SendBtn(_ sender: Any) {
        let text = nameLabel.text!
        if text == "오승훈"{
            guard let name = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
            self.navigationController?.pushViewController(name, animated: true)
            name.helloText = nameLabel.text!
            let alert = UIAlertController(title: "알림", message: "반갑습니다!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "알림", message: "이름을 다시 입력해 주시오", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }


    
}

