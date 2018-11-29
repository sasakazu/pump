//
//  editSetMenu.swift
//  Pump
//
//  Created by 笹倉一也 on 2018/11/06.
//  Copyright © 2018 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class editSetMenu: UIViewController, UITextFieldDelegate {
    
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

        addToolBar(textField: editTF)
        
        addToolBar(textField: set1Kg)
        addToolBar(textField: set1Rep)
        
        addToolBar(textField: set2Kg)
        addToolBar(textField: set2Rep)
        
        addToolBar(textField: set3Kg)
        addToolBar(textField: set3Rep)
        
        addToolBar(textField: set4Kg)
        addToolBar(textField: set4Rep)
        
        addToolBar(textField: set5Kg)
        addToolBar(textField: set5Rep)
        
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
    

    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(editSetMenu.donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editSetMenu.cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        editTF.delegate = self
        set1Kg.delegate = self
        set1Rep.delegate = self
        set2Kg.delegate = self
        set2Rep.delegate = self
        set3Kg.delegate = self
        set3Rep.delegate = self
        set4Kg.delegate = self
        set4Rep.delegate = self
        set5Kg.delegate = self
        set5Rep.delegate = self
        
        editTF.inputAccessoryView = toolBar
        set1Kg.inputAccessoryView = toolBar
        set1Rep.inputAccessoryView = toolBar
        set2Kg.inputAccessoryView = toolBar
        set2Rep.inputAccessoryView = toolBar
        set3Kg.inputAccessoryView = toolBar
        set3Rep.inputAccessoryView = toolBar
        set4Kg.inputAccessoryView = toolBar
        set4Rep.inputAccessoryView = toolBar
        set5Kg.inputAccessoryView = toolBar
        set5Rep.inputAccessoryView = toolBar
        
    }
    
    
    
    @objc func donePressed(){
        view.endEditing(true)
    }
    
    @objc func cancelPressed(){
        view.endEditing(true)
    }
    
    
}
