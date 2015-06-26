//
//  HeroDataWatchController.swift
//  Werable_iOS_Swift
//
//  Created by Josh Ketcham on 5/9/15.
//  Copyright (c) 2015 Full Sail. All rights reserved.
//

import WatchKit
import Foundation


class HeroDataWatchController: WKInterfaceController {

    @IBOutlet weak var heroLabel: WKInterfaceLabel!
    
    @IBOutlet weak var actorLabel: WKInterfaceLabel!
    
    @IBOutlet weak var heroImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        var theContext = context as! NSArray

        heroLabel.setText((theContext[0] as! String))
        
        actorLabel.setText((theContext[1] as! String))
        
        heroImage.setImage(UIImage(data: theContext[2] as! NSData))
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
