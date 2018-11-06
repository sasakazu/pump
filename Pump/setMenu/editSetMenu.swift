//
//  editSetMenu.swift
//  Pump
//
//  Created by 笹倉一也 on 2018/11/06.
//  Copyright © 2018 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class editSetMenu: UIViewController {
    
    var setNamePlaceholder:String = ""
    
    var set1KgPlaceholder:String = ""
    var set1RepPlaceholder:String = ""
    
    var set2KgPlaceholder:String = ""
    var set2RepPlaceholder:String = ""
    
    var set3KgPlaceholder:String = ""
    var set3RepPlaceholder:String = ""
    
    var set4KgPlaceholder:String = ""
    var set4RepPlaceholder:String = ""
    
    var set5KgPlaceholder:String = ""
    var set5RepPlaceholder:String = ""
    
    
    @IBOutlet weak var editTF: UITextField!
    
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
        
        editTF.text = setNamePlaceholder
        
        set1Kg.text = set1KgPlaceholder
        set1Rep.text = set1RepPlaceholder
        set2Kg.text = set2KgPlaceholder
        set2Rep.text = set2RepPlaceholder
        set3Kg.text = set3KgPlaceholder
        set3Rep.text = set3RepPlaceholder
        set4Kg.text = set4KgPlaceholder
        set4Rep.text = set4RepPlaceholder
        set5Kg.text = set5KgPlaceholder
        set5Rep.text = set5RepPlaceholder

        
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let realm = try! Realm()

        let editMenus = realm.objects(Training.self).filter( "name == %@",setNamePlaceholder )
        
        if let editMenu = editMenus.first
        {
          
           
            try! realm.write {
                
                editMenu.name = editTF.text!
                
                editMenu.set1KG = set1Kg.text!
                editMenu.set1Rep = set1Rep.text!
                editMenu.set2KG = set2Kg.text!
                editMenu.set2Rep = set2Rep.text!
                editMenu.set3KG = set3Kg.text!
                editMenu.set3Rep = set3Rep.text!
                editMenu.set4KG = set4Kg.text!
                editMenu.set4Rep = set4Rep.text!
                editMenu.set5KG = set5Kg.text!
                editMenu.set5Rep = set5Rep.text!
  
               
                print("2回目成功だよ", editMenu)

               
            }
            
        }
    
   navigationController?.popToRootViewController(animated: true)
        
        
    }
    


    
    
    
    
    
    
    
    
}
