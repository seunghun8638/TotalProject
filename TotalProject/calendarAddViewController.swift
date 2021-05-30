//
//  calendarAddViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/20.
//

import UIKit
import RealmSwift



class calendarAddViewController: UIViewController {
    var realm : Realm!
    
    var dateText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
    }

    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var calMemo: UITextView!
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        let memoText = calMemo.text
        if memoText?.count == 0{
            
        }else {
            let dateText = dateText!
            
            let info = calendarInfo()
            info.date = dateText
            info.content = calMemo.text!
            try! realm.write {
                realm.add(info)
                print(realm.objects(calendarInfo.self))
            }
            dismiss(animated: true, completion: nil)
        }
      
    }

}
