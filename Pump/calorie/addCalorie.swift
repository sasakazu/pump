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
        
        carolieName.delegate = self
    
    }
    
    
    
    @IBAction func addCarolie(_ sender: Any) {
     
        let newTodo = ToDo()
        
        // textFieldに入力したデータをnewTodoのtitleに代入
        newTodo.title = carolieName.text!
        
        // 上記で代入したテキストデータを永続化するための処理
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newTodo)
                print("ToDo Saved")
            })
        }catch{
            print("Save is Faild")
        }
        
        dismiss(animated: true, completion: nil)
   
    
    }
    
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    

}
