//
//  InterfaceController.swift
//  MessagingTest WatchKit Extension
//
//  Created by Barrow, Joshua on 7/14/15.
//  Copyright © 2015 Jukaela Enterprises. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var upperLeftButton: WKInterfaceButton!
    @IBOutlet var upperRightButton: WKInterfaceButton!
    @IBOutlet var lowerLeftButton: WKInterfaceButton!
    @IBOutlet var lowerRightButton: WKInterfaceButton!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if (WCSession.isSupported()) {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    @IBAction func upperLeft() {
        print("UL")
        
        self.updateApplicationContextWithPlacement("UL")
    }
    
    @IBAction func upperRight() {
        print("UR")
        
        self.updateApplicationContextWithPlacement("UR")
    }
    
    @IBAction func lowerLeft() {
        print("LL")
        
        self.updateApplicationContextWithPlacement("LL")
    }
    
    @IBAction func lowerRight() {
        print("LR")
        
        self.updateApplicationContextWithPlacement("LR")
    }
    
    // MARK -: WCSessionDelegate
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        print(applicationContext)
        
        let okButton = WKAlertAction(title: "OK", style: WKAlertActionStyle.Default, handler: { () -> Void in })
        
        self.presentAlertControllerWithTitle("Application Context Received", message: applicationContext.description, preferredStyle: .Alert, actions: [okButton])
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
