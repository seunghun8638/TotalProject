//
//  loginViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/13.
//

import UIKit
import Firebase

class memoViewController : UITableViewController{
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.memoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? listcell {
            let data = memo.memoList[indexPath.row]
            cell.titleList.text = data.cotent
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let info = segue.destination as? memoDeatilViewController
            if let index = sender as? Int{
                let memo = memo.memoList[index]
                info?.text = memo.cotent
                print(memo.cotent)
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    //화면에 표시되기 직전에 자동 호출
    //테이블뷰 목록 업데이트
  
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        update()
//        saveBasicTypes()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
  
//    @IBOutlet var dataLabel: UILabel!
    
//    func update(){
//        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
//            print("--->\(snapshot)")
//
//            let value = snapshot.value as? String ?? ""
////                self.dataLabel.text = value
//        }
//    }
    
}
//
//extension memoViewController {
//    func saveBasicTypes() {
//        //firebase child ("key").setValue(Value)
//        //-string,numbr,dictionary , array
//        db.child("int").setValue(3)
//        db.child("doble").setValue(3.5)
//        db.child("str").setValue("string value - 여러분 안녕")
//        db.child("array").setValue(["a","b","c"])
//        db.child("dict").setValue(["id":"anyId","age":10,"city":"seoul"])
//    }
//
//
//}

class memo {
    var cotent : String
    
    init(content : String) {
        self.cotent = content
    }
    
    static var memoList = [
        memo(content: "오승훈"),
        memo(content: "Hello")
    ]
    
}


class listcell : UITableViewCell{
    @IBOutlet var titleList: UILabel!
    @IBOutlet var subtitleList: UILabel!
}
