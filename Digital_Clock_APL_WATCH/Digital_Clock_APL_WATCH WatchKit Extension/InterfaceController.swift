//
//  InterfaceController.swift
//  Digital_Clock_APL_WATCH WatchKit Extension
//
//  Created by Josh Ketcham on 2/14/15.
//  Copyright (c) 2015 Full Sail. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var timeLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        var updateTime = NSTimer()
        updateTime = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTheTime"), userInfo: nil, repeats: true)
        
        updateTheTime()

        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    func updateTheTime() {
        
        var currentDate = NSDate()
        var timeFormat = NSDateFormatter()
        timeFormat.dateFormat = "h:mm:ss a"
        
        var string = timeFormat.stringFromDate(currentDate)
    
        timeLabel.setText(string)
//        println(timeFormat.stringFromDate(currentDate))
        
    }

    
}
