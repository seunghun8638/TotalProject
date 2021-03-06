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
        
        //제목과 내용뷰에 테두리 및 테두리 색깔 지정
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
        
        //if를 사용하여 텍스트가 없을 시,알림 발생
        if title.count == 0 {
            alertMessage("제목을 입력해주시오")
        }else if content.count == 0{
            alertMessage("내용을 입력해주시오")
        }
        else{
            //제목과 내용이 둘다 있으면, memoInfo()안에 값을 저장
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
