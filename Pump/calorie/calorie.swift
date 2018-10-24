//
//  calorie.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class calorie: UIViewController {
   
    
    @IBOutlet weak var todayDate: UILabel!
    
    @IBOutlet weak var totalCarolie: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayDate.text = getNowClockString()
    
    }
    
    

    

    func getNowClockString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日"
        let now = Date()
        return formatter.string(from: now)
    }
    
    

}
