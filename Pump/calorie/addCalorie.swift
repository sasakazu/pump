//
//  addCalorie.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class addCalorie: UIViewController {
    
    
    @IBOutlet weak var carolieName: UITextField!
    
    @IBOutlet weak var carolieNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addCarolie(_ sender: Any) {
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    

}
