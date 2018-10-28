//
//  setMenuDetail.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/28.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class setMenuDetail: UIViewController {
    
    var trainingName:String = ""
    var training1setKG:String = ""
    
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
        set1KGLabel.text = "\(training1setKG)Kg"
        
        
    }
    

  

}
