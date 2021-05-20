//
//  memoDetailViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/17.
//

import UIKit

class memoaddViewController: UIViewController {

    @IBOutlet var memoTextView: UITextView!
    
    var delegate : listcell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any) {
        if let memoText = memoTextView.text , memoText.count == 0 {
            let alert  = UIAlertController(title: "알림", message: "입력해주시오", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else if let memoText = memoTextView.text , memoText.count != 0{
            let memotext = memo(content: memoText)
            memo.memoList.append(memotext)
            print("\(memo.memoList)")
            dismiss(animated: true, completion: nil)
        }
           
        }
        
    }

