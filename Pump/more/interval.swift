//
//  interval.swift
//  Pump
//
//  Created by 笹倉 一也 on 2018/10/27.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class interval: UIViewController {
    
    var timer = Timer()
    var startTime: TimeInterval = 0
    var elapsedTime: Double = 0.0
    var time : Double = 0.0
    
    
    @IBOutlet weak var minute: UILabel!
    
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startBtn(_ sender: Any) {
        start.isEnabled = false
        reset.isEnabled = false
        stop.isEnabled = true
        startTime = Date().timeIntervalSince1970
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        start.isEnabled = true
        reset.isEnabled = true
        // Stopボタンを無効化
        stop.isEnabled = false
        // タイマー処理を止める
        timer.invalidate()
        // 再度Startボタンを押した時に加算するため、これまでに計測した経過時間を保存
        elapsedTime = time
        
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        elapsedTime = 0.0
        minute.text = "00:00.00"
    
    }
    
    @objc func update() {

        time = Date().timeIntervalSince1970 - startTime + elapsedTime
      
        let sec = Int(time)
        let msec = Int((time - Double(sec)) * 100)
       
        let displayStr = NSString(format: "%02d:%02d.%02d", sec/60, sec%60, msec) as String
        minute.text = displayStr
    }
    

}
