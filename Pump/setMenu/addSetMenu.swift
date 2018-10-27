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
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newMenu)
                print("成功！！")
            })
        }catch{
            print("失敗！！！")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
 

}
