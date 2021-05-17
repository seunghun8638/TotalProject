//
//  loginViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/13.
//

import UIKit
import Firebase

class memoViewController : UITableViewController{

    
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        saveBasicTypes()
        
    }
    @IBOutlet var dataLabel: UILabel!
    
    func update(){
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("--->\(snapshot)")
            
            let value = snapshot.value as? String ?? ""
//                self.dataLabel.text = value
        }
    }
    
}

extension memoViewController {
    func saveBasicTypes() {
        //firebase child ("key").setValue(Value)
        //-string,numbr,dictionary , array
        db.child("int").setValue(3)
        db.child("doble").setValue(3.5)
        db.child("str").setValue("string value - 여러분 안녕")
        db.child("array").setValue(["a","b","c"])
        db.child("dict").setValue(["id":"anyId","age":10,"city":"seoul"])
    }
    

}

