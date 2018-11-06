//
//  carolieTable.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/27.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class carolieTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carolieItem: Results<Carolie>!
    var selectedImage:Int = 0
  
    @IBOutlet weak var carolieNumber: UILabel!
    @IBOutlet weak var carolieTable: UITableView!

        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationItem.leftBarButtonItem = editButtonItem
        do{
            let realm = try Realm()

            carolieItem = realm.objects(Carolie.self)
           
//            for dog in dogs {
//
//           print("カロリー数: \(dog.number)")
//
////           carolieNumber.text = String(dog.number)
//
//            }
        
            carolieTable.reloadData()
            
            
        }catch{
        

        }
        
        carolieTable.delegate = self
        carolieTable.dataSource = self
        
        
          print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        carolieTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        let realm = try! Realm()
        
         let carolieItem = realm.objects(Carolie.self)
        
        return carolieItem.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")

        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = carolieTable.dequeueReusableCell(withIdentifier: "Cell",
                                                    for: indexpath)
        
        let realm = try! Realm()
        
        let carolieItem = realm.objects(Carolie.self)
        
        let object = carolieItem[indexpath.row]
        
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = object.name

        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = "\(String(object.number)) cal"
        
        
        return cell
        
    
    }

    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.carolieItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }catch{
            }
            
            tableView.reloadData()
        
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        carolieTable.isEditing = editing
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let object = carolieItem[indexPath.row]
//
//        selectedImage = object.name
//
//        performSegue(withIdentifier: "carolieDetail",sender: nil)
//        
//    }
//    
//    
//   override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//        if (segue.identifier == "carolieDetail") {
//            
//            
//            let secondVC: carolieDetail = (segue.destination as? carolieDetail)!
//            
//            
//            secondVC.selectedImg = selectedImage!
//        
//        }
//    
//    }
//
    
    
    
    
    

}
