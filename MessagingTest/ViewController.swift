//
//  ViewController.swift
//  MessagingTest
//
//  Created by Barrow, Joshua on 7/14/15.
//  Copyright © 2015 Jukaela Enterprises. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    @IBOutlet weak var upperLeftButton: UIButton!
    @IBOutlet weak var upperRightButton: UIButton!
    @IBOutlet weak var lowerLeftButton: UIButton!
    @IBOutlet weak var lowerRightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()) {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func upperLeft(sender: UIButton) {
        print("UL")
        
        self.updateApplicationContextWithPlacement("UL")
    }
    
    @IBAction func upperRight(sender: UIButton) {
        print("UR")
        
        self.updateApplicationContextWithPlacement("UR")
    }
    
    @IBAction func lowerLeft(sender: UIButton) {
        print("LL")
        
        self.updateApplicationContextWithPlacement("LL")
    }
    
    @IBAction func lowerRight(sender: UIButton) {
        print("LR")
        
        self.updateApplicationContextWithPlacement("LR")
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        print(applicationContext)
        
        let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let alert = UIAlertController(title: "Application Context Received", message: applicationContext.description, preferredStyle: .Alert)
        alert.addAction(okButton)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateApplicationContextWithPlacement(placement: String) {
        do {
            let applicationContext = ["placement": placement]
            
            try WCSession.defaultSession().updateApplicationContext(applicationContext)
        }
        catch {
            print(error)
        }
    }
}



