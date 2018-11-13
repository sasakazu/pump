//
//  working.swift
//  Pump
//
//  Created by 笹倉一也 on 2018/11/11.
//  Copyright © 2018 sasakura.company. All rights reserved.
//

import UIKit
import CoreMotion


class working: UIViewController {
    
    let pedometer = CMPedometer()
    

    @IBOutlet weak var walkingCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CMPedometerの確認
        if(CMPedometer.isStepCountingAvailable()){
            
            self.pedometer.startUpdates(from: NSDate() as Date) {
                (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        // 歩数 NSNumber?
                        let steps = data!.numberOfSteps
                        var results:String = String(format:"歩数: %d歩", steps.intValue)
                        results += "\n"

                        self.walkingCount.text = results
                        
                    }
                    
                })
            }
        }
    }

    
 
}
