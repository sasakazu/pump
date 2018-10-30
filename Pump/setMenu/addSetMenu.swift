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
    @IBOutlet weak var set2Kg: UITextField!
    @IBOutlet weak var set2Rep: UITextField!
    @IBOutlet weak var set3Kg: UITextField!
    @IBOutlet weak var set3Rep: UITextField!
    @IBOutlet weak var set4Kg: UITextField!
    @IBOutlet weak var set4Rep: UITextField!
    @IBOutlet weak var set5Kg: UITextField!
    @IBOutlet weak var set5Rep: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addMenu(_ sender: Any) {
        
        let newMenu = Training()
        
        newMenu.name = trainingName.text!
        
        newMenu.set1KG = set1Kg.text!
        newMenu.set1Rep = set1Rep.text!
        
        newMenu.set2KG = set2Kg.text!
        newMenu.set2Rep = set2Rep.text!
        
        newMenu.set3KG = set3Kg.text!
        newMenu.set3Rep = set3Rep.text!
        
        newMenu.set4KG = set4Kg.text!
        newMenu.set4Rep = set4Rep.text!
        
        newMenu.set5KG = set5Kg.text!
        newMenu.set5Rep = set5Rep.text!
        
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newMenu)
                print("成功！！")
                
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
