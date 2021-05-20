//
//  calendarAddViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/20.
//

import UIKit

class calendarAddViewController: UIViewController {

    
    var dateText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateLabel.text = dateText
    }
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var calMemo: UITextView!
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if let memoText = calMemo.text,let dateMemo = dateLabel.text , memoText.count != 0{
            let dateText = DateMemo(date: dateMemo)
            let memoText = TextMemo(textMemo: memoText)
            
            DateMemo.DateMemoList.append(dateText)
            TextMemo.TextMemoList.append(memoText)
            
            dismiss(animated: true, completion: nil)
        }
      
    }
    
    

}
