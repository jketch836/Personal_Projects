//
//  InterfaceController.swift
//  Werable_iOS_Swift WatchKit Extension
//
//  Created by Josh Ketcham on 2/25/15.
//  Copyright (c) 2015 Full Sail. All rights reserved.
//

import WatchKit
import Foundation


class HeroImage: NSObject {
    
    @IBOutlet weak var heroImage: WKInterfaceImage!
    
}

class InterfaceController: WKInterfaceController, UITableViewDelegate {

    @IBOutlet weak var theDataTable: WKInterfaceTable!

    var heroImageArray = NSArray()
    var actorArray = NSArray()
    var heroNameArray = NSArray()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
         // Configure interface objects here.
        
        var dictionary = NSDictionary(object: NSNumber(bool: true),
            forKey:"heroData") as [NSObject : AnyObject]

        
        
        WKInterfaceController.openParentApplication(dictionary) {
            (replyInfo, error) -> Void in
            
            if error == nil {
                
                self.heroImageArray = replyInfo["theHeroImageData"]! as! NSArray
                self.actorArray = replyInfo["theHeroActorData"]! as! NSArray
                self.heroNameArray = replyInfo["theHeroNameData"]! as! NSArray
                
                
            self.configTableWithData(self.heroImageArray)
                
            }
            
        }

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    func configTableWithData(dataObject: NSArray) {
        
        self.theDataTable.setNumberOfRows(dataObject.count, withRowType: "selectedHero")
        
        for var i = 0; i < self.theDataTable.numberOfRows; i++ {
            
            var heroRow : HeroImage = self.theDataTable.rowControllerAtIndex(i) as! HeroImage
            
            var data :NSData = dataObject.objectAtIndex(i) as! NSData
            
            heroRow.heroImage.setImage(UIImage(data: data))
            
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {

        
        var heroNameString :NSString = heroNameArray[rowIndex] as! NSString
        
        var actorNameString :NSString = actorArray[rowIndex] as! NSString
        
        var imageData : NSData = heroImageArray[rowIndex] as! NSData
        
        
        var theDataArray : NSArray = [heroNameString, actorNameString, imageData]
        
        
        self.pushControllerWithName("InterfaceData", context: theDataArray)
        
//        NSString * name = theHeroNameArray[rowIndex];
//        
//        NSLog(@"%ld", (long)rowIndex);
//        
//        NSLog(@"%@", name);
//        
//        NSData * data = theArray[rowIndex];
//        
//        NSString * actor = theActorNameArray[rowIndex];
//        
//        NSArray * stringItemArray = [[NSArray alloc] initWithObjects:name, actor, data, nil];
//        
//        
//        [self pushControllerWithName:@"InterfaceData" context: stringItemArray];

        
    }

}
