//
//  Trigger.swift
//  TaxiApp
//
//  Created by dede.exe on 15/10/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class Trigger {
    
    public let action : (()->Void)?
    public let interval : TimeInterval
    private var timer : Timer?
    
    init() {
        interval = 0
        action = nil
    }
    
    init(in interval:TimeInterval, action:(()->Void)? = nil) {
        self.interval = interval
        self.action = action
    }
    
    func execute() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(actionTriggered), userInfo: nil, repeats: false)
    }
    
    @objc private func actionTriggered(sender:Timer) {
        action?()
        sender.invalidate()
    }
    
    deinit {
        timer?.invalidate()
    }
}
