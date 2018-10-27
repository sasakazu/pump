//
//  setMenu.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift


class setMenu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trainingItem: Results<Training>!
    
    @IBOutlet weak var trainigTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        do{
            let realm = try Realm()
            trainingItem = realm.objects(Training.self)
            trainigTable.reloadData()
        }catch{
            
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        trainigTable.reloadData()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        return trainingItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        let object = trainingItem[indexpath.row]
        
        cell.textLabel?.text = object.name
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.trainingItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }catch{
            }
            
            tableView.reloadData()
            
        }
    }
    
    
    

}
