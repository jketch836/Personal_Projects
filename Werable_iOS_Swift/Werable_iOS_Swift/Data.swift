//
//  Data.swift
//  Werable_iOS_Swift
//
//  Created by Josh Ketcham on 2/25/15.
//  Copyright (c) 2015 Full Sail. All rights reserved.
//

import UIKit

class Data: NSObject {
    
    var heroName:NSString
    var actorName:NSString
    var heroImage:UIImage!
    
    init(nameOfHero:NSString, theActorName:NSString, theHeroImage:UIImage) {
        
        self.heroName = nameOfHero
        self.actorName = theActorName
        self.heroImage = theHeroImage
        
        super.init()
        
    }
   
}
