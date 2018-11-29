//
//  setMenuDetail.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/28.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class setMenuDetail: UIViewController {
    
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
    
    
    @IBOutlet weak var trainingNameLabel: UILabel!
   
    @IBOutlet weak var set1KGLabel: UILabel!
    @IBOutlet weak var set1RepLabel: UILabel!
    @IBOutlet weak var set2KGLabel: UILabel!
    @IBOutlet weak var set2RepLabel: UILabel!
    @IBOutlet weak var set3KGLabel: UILabel!
    @IBOutlet weak var set3RepLabel: UILabel!
    @IBOutlet weak var set4KGLabel: UILabel!
    @IBOutlet weak var set4RepLabel: UILabel!
    @IBOutlet weak var set5KGLabel: UILabel!
    @IBOutlet weak var set5RepLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        trainingNameLabel.text = trainingName
        
        set1KGLabel.text = "\(training1setKG) Kg"
        set1RepLabel.text = "\(training1setRep) Rep"
        
        set2KGLabel.text = "\(training2setKG) Kg"
        set2RepLabel.text = "\(training2setRep) Rep"
        
        set3KGLabel.text = "\(training3setKG) Kg"
        set3RepLabel.text = "\(training3setRep) Rep"
        
        set4KGLabel.text = "\(training4setKG) Kg"
        set4RepLabel.text = "\(training4setRep) Rep"
        
        set5KGLabel.text = "\(training5setKG) Kg"
        set5RepLabel.text = "\(training5setRep) Rep"
        
    }
    

    @IBAction func editBtn(_ sender: Any) {
         performSegue(withIdentifier: "goEditSetMenu",sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "goEditSetMenu") {
            
            
            let editVC: editSetMenu = (segue.destination as? editSetMenu)!
            
            
            editVC.setNamePlaceholder = trainingNameLabel.text!
            
            editVC.set1KgPlaceholder = training1setKG
            editVC.set1RepPlaceholder = training1setRep
            editVC.set2KgPlaceholder = training2setKG
            editVC.set2RepPlaceholder = training2setRep
            editVC.set3KgPlaceholder = training3setKG
            editVC.set3RepPlaceholder = training3setRep
            editVC.set4KgPlaceholder = training4setKG
            editVC.set4RepPlaceholder = training4setRep
            editVC.set5KgPlaceholder = training5setKG
            editVC.set5RepPlaceholder = training5setRep
            
            
            
        }
        
    }
    

}
