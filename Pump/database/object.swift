//
//  object.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/26.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import Foundation
import RealmSwift



class Carolie: Object {
    @objc dynamic var todayTime = ""
    @objc dynamic var name = ""
    @objc dynamic var number = 0
    
    
}


class Training: Object {
    
    @objc dynamic var order = 0
    
    @objc dynamic var name = ""
    
    @objc dynamic var set1KG = ""
    @objc dynamic var set1Rep = ""
    
    @objc dynamic var set2KG = ""
    @objc dynamic var set2Rep = ""

    @objc dynamic var set3KG = ""
    @objc dynamic var set3Rep = ""

    @objc dynamic var set4KG = ""
    @objc dynamic var set4Rep = ""

    @objc dynamic var set5KG = ""
    @objc dynamic var set5Rep = ""

//    override static func primaryKey() -> String? {
//        return "name"
//    }
    
    
}




