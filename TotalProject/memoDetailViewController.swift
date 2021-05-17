//
//  memoDetailViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/17.
//

import UIKit

class memoDetailViewController: UIViewController {

    @IBOutlet var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any) {
        if let memo = memoTextView.text , memo.count ==  0  {
            let alert  = UIAlertController(title: "알림", message: "입력해주시오", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else if let memo = memoTextView.text , memo.count >   0{
        let newMemo = Memo(content: memo)
        Memo.memoList.append(newMemo)
            
            dismiss(animated: true, completion: nil )
           
        }
        
    }

}

class Memo {
    var content : String
    var insertDate : Date = Date()
    
    init(content : String){
        self.content = content
        self.insertDate = Date()
    }
    
    static var memoList = [
        Memo(content: "Memo List"),Memo(content: "Ohseunghun")
    ]
}
