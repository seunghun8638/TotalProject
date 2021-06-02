//
//  memoDetailViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/17.
//

import UIKit
import Firebase
import RealmSwift


class memoaddViewController: UIViewController {

    var realm : Realm!
    
    @IBOutlet var titleText: UITextField!
    @IBOutlet var contentText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        contentText.layer.borderWidth = 0.5
        contentText.layer.borderColor = UIColor.black.cgColor
        titleText.layer.borderWidth = 0.5
        titleText.layer.borderColor = UIColor.black.cgColor
    }
    

    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let title = titleText.text!
        let content = contentText.text!
        
        if title.count == 0 {
            alertMessage("제목을 입력해주시오")
        }else if content.count == 0{
            alertMessage("내용을 입력해주시오")
        }
        else{
            let memoInfoA = memoInfo()
            memoInfoA.title = title
            memoInfoA.content = content
            try! realm.write {
                realm.add(memoInfoA)
            }
            dismiss(animated: true, completion: nil)
        }
    }
}
extension memoaddViewController {
    func alertMessage(_ message : String){
        let alert = UIAlertController.init(title: "알림", message: message, preferredStyle: .alert)
        let OK = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        alert.addAction(OK)
        present(alert, animated: true, completion: nil)
    }

}
