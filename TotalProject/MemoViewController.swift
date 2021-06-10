//
//  loginViewController.swift
//  TotalProject
//
//  Created by 오승훈 on 2021/05/13.
//

import UIKit
import RealmSwift

class memoInfo:Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
}

class memoViewController : UITableViewController{
    
    @IBOutlet var tableview: UITableView!
    var realm : Realm!
    
    @IBAction func reloadBtn(_ sender: Any) {
        tableview.reloadData()
        realm = try! Realm()
    }
    @IBAction func deleteBtn(_ sender: Any) {
        realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let listNum = realm.objects(memoInfo.self)
        return listNum.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? listcell {
            let item = realm.objects(memoInfo.self)
            let titleItem = item[indexPath.row].title
            let contentItem = item[indexPath.row].content
            cell.titleList.text = titleItem
            cell.subtitleList.text = contentItem
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let info = segue.destination as? memoDeatilViewController
            if let index = sender as? Int{
                let item = realm.objects(memoInfo.self)
                let loadTitle = item[index].title
                let loadContent = item[index].content
                info?.Atitle = loadTitle
                info?.AContent = loadContent
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        realm = try! Realm()
    }
    
    
    
}

class listcell : UITableViewCell{
    @IBOutlet var titleList: UILabel!
    @IBOutlet var subtitleList: UILabel!
}

