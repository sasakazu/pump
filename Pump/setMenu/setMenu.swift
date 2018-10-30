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
    var trainingName:String = ""
    
    var training1setKG:String = ""
    var training1setRep:String = ""
    
    var training2setKG:String = ""
    var training2setRep:String = ""
    
    var training3setKG:String = ""
    var training3setRep:String = ""
    
    var training4setKG:String = ""
    var training4setRep:String = ""
    
    var training5setKG:String = ""
    var training5setRep:String = ""
    
    
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = trainingItem[indexPath.row]
        
        trainingName = object.name
        
        training1setKG = object.set1KG
        training1setRep = object.set1Rep
        
        training2setKG = object.set2KG
        training2setRep = object.set2Rep
        
        training3setKG = object.set3KG
        training3setRep = object.set3Rep
        
        training4setKG = object.set4KG
        training4setRep = object.set4Rep
        
        training5setKG = object.set5KG
        training5setRep = object.set5Rep
        
        performSegue(withIdentifier: "setMenuDetail",sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "setMenuDetail") {
            
            
            let secondVC: setMenuDetail = (segue.destination as? setMenuDetail)!
            
            
            secondVC.trainingName = trainingName
            
            secondVC.training1setKG = training1setKG
            secondVC.training1setRep = training1setRep
            
            secondVC.training2setKG = training2setKG
            secondVC.training2setRep = training2setRep
            
            secondVC.training3setKG = training3setKG
            secondVC.training3setRep = training3setRep
            
            secondVC.training4setKG = training4setKG
            secondVC.training4setRep = training4setRep
            
            secondVC.training5setKG = training5setKG
            secondVC.training5setRep = training5setRep
        
        
        }
        
    }
    
    

}
