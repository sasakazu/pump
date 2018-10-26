//
//  calorie.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class calorie: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
      var todoItem: Results<ToDo>!

   
    @IBOutlet weak var carolieTableview: UITableView!
    
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var totalCarolie: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 追加
        // 永続化されているデータを取りだす
        do{
            let realm = try Realm()
            todoItem = realm.objects(ToDo.self)
            carolieTableview.reloadData()
        }catch{
            
        }
     
        todayDate.text = getNowClockString()
        
    
    
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        carolieTableview.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        // todoItemの数 = セルの数
        return todoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        // todoItemに代入されたデータをobject:NSArrayに代入
        let object = todoItem[indexpath.row]
        
        //cellのtextLabelのtextにobjectのtitleプロパティを代入
        cell.textLabel?.text = object.title
        
        return cell
    }

 
    
    

    func getNowClockString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日"
        let now = Date()
        return formatter.string(from: now)
    }
    
    

}
