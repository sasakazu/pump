//
//  carolieDetail.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/27.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift

class carolieDetail: UIViewController {

    var cn:String = ""
    var selectedImg:String = ""
    
    @IBOutlet weak var carolieName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let realm = try! Realm()
//
//        let carolieNames = realm.objects(Carolie.self)
//
//        for carolieName in carolieNames {
//            print("name: \(carolieName.name)")
        
        carolieName.text = selectedImg
       
//    }
}



}
