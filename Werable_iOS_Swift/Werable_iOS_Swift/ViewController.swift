//
//  ViewController.swift
//  Werable_iOS_Swift
//
//  Created by Josh Ketcham on 2/25/15.
//  Copyright (c) 2015 Full Sail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var avengersHeroName:NSArray = []
    var avengersActorName:NSArray = []
    var avengersHeroImage:NSArray = []
    
    @IBOutlet weak var theTable: UITableView!
    
    var theDefaults:NSUserDefaults = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var ironMan:Data! = Data(nameOfHero: "Iron Man", theActorName: "Robert Downey Jr.", theHeroImage: UIImage(named: "Avengers-Iron-Man")!)
        
        var warMachine:Data! = Data(nameOfHero: "War Machine", theActorName: "Don Cheadle", theHeroImage: UIImage(named: "Avengers-War-Machine")!)
        
        var blackWidow:Data! = Data(nameOfHero: "Black Widow", theActorName: "Scarlett Johansson", theHeroImage: UIImage(named: "Avengers-Black-Widow")!)
        
        var nickFury:Data! = Data(nameOfHero:"Nick Fury", theActorName: "Samuel L. Jackson", theHeroImage: UIImage(named: "Avengers-Nick-Fury")!)
        
        var loki:Data! = Data(nameOfHero: "Loki", theActorName: "Tom Hiddleston", theHeroImage: UIImage(named: "Avengers-Loki")!)
        
        var hulk:Data! = Data(nameOfHero: "Hulk", theActorName: "Mark Ruffalo", theHeroImage: UIImage(named: "Avengers-Hulk")!)
        
        var hawkeye:Data! = Data(nameOfHero: "Hawkeye", theActorName: "Jeremy Renner", theHeroImage: UIImage(named: "Avengers-Hawkeye")!)
        
        var thor:Data! = Data(nameOfHero: "Thor", theActorName: "Chris Hemsworth", theHeroImage: UIImage(named: "Avengers-Thor")!)
        
        var captainAmerica:Data! = Data(nameOfHero: "Captain America", theActorName: "Chris Evans", theHeroImage: UIImage(named: "Avengers-Captain-America")!)
        
        var agentCoulson:Data! = Data(nameOfHero: "Agent Coulson", theActorName: "Clark Gregg", theHeroImage: UIImage(named: "Avengers-Agent-Coulson")!)
        
    
        avengersHeroName = [ironMan.heroName, warMachine.heroName, blackWidow.heroName, nickFury.heroName, loki.heroName, hulk.heroName, hawkeye.heroName, thor.heroName, captainAmerica.heroName, agentCoulson.heroName];
        
        avengersActorName = [ironMan.actorName, warMachine.actorName, blackWidow.actorName, nickFury.actorName, loki.actorName, hulk.actorName, hawkeye.actorName, thor.actorName, captainAmerica.actorName, agentCoulson.actorName];
        
        avengersHeroImage = [UIImagePNGRepresentation(ironMan.heroImage), UIImagePNGRepresentation(warMachine.heroImage), UIImagePNGRepresentation(blackWidow.heroImage), UIImagePNGRepresentation(nickFury.heroImage), UIImagePNGRepresentation(loki.heroImage), UIImagePNGRepresentation(hulk.heroImage), UIImagePNGRepresentation(hawkeye.heroImage), UIImagePNGRepresentation(thor.heroImage), UIImagePNGRepresentation(captainAmerica.heroImage), UIImagePNGRepresentation(agentCoulson.heroImage)];
        
        
        theDefaults = NSUserDefaults.standardUserDefaults()
        
        theDefaults.setObject(avengersHeroName, forKey: "heroNameArray")
        theDefaults.setObject(avengersActorName, forKey: "heroActorArray")
        theDefaults.setObject(avengersHeroImage, forKey: "heroImageArray")
        
        theDefaults.synchronize()

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return avengersHeroName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var string = avengersHeroName[indexPath.row] as! NSString
        
        cell.textLabel!.text = "\(string)"
        
        return cell;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

