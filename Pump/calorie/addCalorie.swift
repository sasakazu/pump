//
//  addCalorie.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift


class addCalorie: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var carolieName: UITextField!
    
    @IBOutlet weak var carolieNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    @IBAction func addCarolie(_ sender: Any) {
        
        let newCarolie = Carolie()
        
        newCarolie.name = carolieName.text!

     
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newCarolie)
                print("成功！！")
            })
        }catch{
            print("失敗！！！")
        }
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    

}
