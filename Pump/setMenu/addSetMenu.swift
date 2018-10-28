//
//  addSetMenu.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class addSetMenu: UIViewController {
    
    
    @IBOutlet weak var trainingName: UITextField!
    
    @IBOutlet weak var set1Kg: UITextField!
    @IBOutlet weak var set1Rep: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addMenu(_ sender: Any) {
        
        let newMenu = Training()
        
        newMenu.name = trainingName.text!
        newMenu.set1KG = set1Kg.text!
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newMenu)
                print("\(newMenu.name)保存成功！！")
                print("\(newMenu.set1KG)保存成功！！")
                
            })
        }catch{
            print("失敗！！！")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
 

}
