//
//  ViewController.swift
//  ImageAnimationSample
//
//  Created by Josh Ketcham on 4/1/15.
//  Copyright (c) 2015 Josh Ketcham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    var theInt : Int = 0
    var theImages : [UIImage] = [UIImage(named: "avengersironman.png")!, UIImage(named: "avengerswarmachine.png")!]
    var timer = NSTimer()
    var runLoop = NSRunLoop()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = theImages[1]
        pageController.currentPage = theInt
        pageController.pageIndicatorTintColor = UIColor.greenColor()
        pageController.currentPageIndicatorTintColor = UIColor.blueColor()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        timer = NSTimer(timeInterval: 1.0, target: self, selector: "changeImage:", userInfo: nil, repeats: true)
        
        runLoop = NSRunLoop.currentRunLoop()
        
        runLoop.addTimer(timer, forMode: NSDefaultRunLoopMode)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeImage(AnyObject) {
        
        if theInt == theImages.count - 1 {
            
            UIView.transitionWithView(self.imageView, duration: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
                self.imageView.image = self.theImages[self.theInt]
                
            }, completion: { (Bool)  in
                
                self.theInt = 0
                self.pageController.currentPage = self.theInt
                
            })
            
        } else {
            
            UIView.transitionWithView(self.imageView, duration: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
                self.imageView.image = self.theImages[self.theInt]
                
                }, completion: { (Bool)  in
                    
                    self.theInt++
                    self.pageController.currentPage = self.theInt
                    self.pageController.pageIndicatorTintColor = UIColor.greenColor()
                    self.pageController.currentPageIndicatorTintColor = UIColor.blueColor()
                    
                    })

            
        }
        
        
    }


}

