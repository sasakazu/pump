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
    var todayDate:String = ""
  
    @IBOutlet weak var carolieNumber: UILabel!
    @IBOutlet weak var carolieTable: UITableView!
    @IBOutlet weak var today: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        let date:Date = Date()
        
        
        
        let format = DateFormatter()
        format.dateFormat = "MM月dd日"
        
        todayDate = format.string(from: date)
        
        today.text = todayDate
      
        
        do{
            let realm = try Realm()


            carolieItem = realm.objects(Carolie.self).filter("todayTime == %@", todayDate)
            
        
            


        }catch{


        }
        
        
        carolieTable.reloadData()
    
        carolieTable.delegate = self
        carolieTable.dataSource = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carolieTable.reloadData()
    }
    
    
    @IBAction func yesterday(_ sender: Any) {
    }
    
    
    @IBAction func tommorowBtn(_ sender: Any) {
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        
        return carolieItem.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {

        let cell = carolieTable.dequeueReusableCell(withIdentifier: "Cell",
                                                    for: indexpath)
        

        
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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        performSegue(withIdentifier: "gotoAddCarolie",sender: nil)
        
    }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "gotoAddCarolie") {
            
            
            let addVC: addCalorie = (segue.destination as? addCalorie)!
            
            
            addVC.getDate = todayDate
        
        }
    
    }

    
    
    
    
    

}
