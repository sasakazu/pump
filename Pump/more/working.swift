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
//                        // 距離 NSNumber?
//                        let distance = data!.distance!.doubleValue
//                        results += String(format: "distance: %d", Int(distance))
//                        results += "\n"
//
//                        // 期間
//                        let period = data!.endDate.timeIntervalSince(data!.startDate)
//                        // スピード
//                        let speed = distance / period
//                        results += String(format: "speed: %f", speed)
//                        results += "\n"
//
//                        // 平均ペース NSNumber?
//                        let averageActivePace = data!.averageActivePace
//                        results += String(format: "averageActivePace: %f", averageActivePace!.doubleValue)
//                        results += "\n"
//
//                        // ペース NSNumber?
//                        let currentPace = data!.currentPace
//                        results += String(format: "currentPace: %f", currentPace!.doubleValue)
//                        results += "\n"
//
//                        // リズム steps/second NSNumber?
//                        let currentCadence = data!.currentCadence
//                        results += String(format: "currentCadence: %f", currentCadence!.doubleValue)
//                        results += "\n"
//
//                        // 昇ったフロアの数 NSNumber?
//                        let floorsAscended = data!.floorsAscended
//                        results += String(format: "floorsAscended: %d", floorsAscended!.intValue)
//                        results += "\n"
//
//                        // 降りたフロアの数 NSNumber?
//                        let floorsDescended = data!.floorsDescended
//                        results += String(format: "floorsDescended: %d", floorsDescended!.intValue)
//                        results += "\n"
//
//                        // ライン数
//                        self.walkingCount.numberOfLines = 10
//
                        self.walkingCount.text = results
                        
                    }
                    
                })
            }
        }
    }

    
 
}
