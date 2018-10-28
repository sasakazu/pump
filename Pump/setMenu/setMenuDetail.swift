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
    
    @IBOutlet weak var trainingNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        trainingNameLabel.text = trainingName
        
    }
    

  

}
