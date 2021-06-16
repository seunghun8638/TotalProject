//
//  webViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/06/16.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webViewSite("http://www.google.com")
    }
    
    @IBAction func selectSeg(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            webViewSite("http://www.google.com")
        }else {
            webViewSite("http://www.naver.com")
        }
    }
    

    func webViewSite(_ site : String){
        let url = URL(string: site)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
