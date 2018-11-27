//
//  addCalorie.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/23.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMobileAds

class addCalorie: UIViewController, UITextFieldDelegate {
    
    var getDate:String = ""
    
    var testText:Int = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var carolieName: UITextField!
    @IBOutlet weak var carolieNumber: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationItem.title = getDate
        
        
        let AdMobID = "ca-app-pub-5047644305890156~6850338485"
        let TEST_ID = "ca-app-pub-3940256099942544/2934735716"
        
        let AdMobTest:Bool = true
        
        
        var admobView = GADBannerView()
        
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        // iPhone X のポートレート決め打ちです
        admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height - 84)
        admobView.frame.size = CGSize(width:self.view.frame.width, height:admobView.frame.height)
        
        if AdMobTest {
            admobView.adUnitID = TEST_ID
        }
        else{
            admobView.adUnitID = AdMobID
        }
        
        admobView.rootViewController = self
        admobView.load(GADRequest())
        
        self.view.addSubview(admobView)
        
        
    }
    

    
    @IBAction func addCarolie(_ sender: Any) {
        
        let newCarolie = Carolie()
        
        testText = Int(carolieNumber.text!)!
        
        newCarolie.name = carolieName.text!
        newCarolie.number = testText
        newCarolie.todayTime = getDate

        

        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newCarolie)
                print("成功！！")
                
                
            })
        }catch{
            print("失敗！！！")
        }
        
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    

}
