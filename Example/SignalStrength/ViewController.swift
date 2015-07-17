//
//  ViewController.swift
//  SignalStrength
//
//  Created by Tanner Nelson on 07/17/2015.
//  Copyright (c) 2015 Tanner Nelson. All rights reserved.
//

import UIKit
import SignalStrength

class ViewController: UIViewController {

    @IBOutlet weak var signalStrengthView: SignalStrengthView!
    
    @IBAction func changeButtonPressed(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Change Signal Strength", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(
            UIAlertAction(title: "Excellent", style: .Default, handler: { action in
                self.signalStrengthView.signal = .Excellent
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "Very Good", style: .Default, handler: { action in
                self.signalStrengthView.signal = .VeryGood
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "Good", style: .Default, handler: { action in
                self.signalStrengthView.signal = .Good
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "Low", style: .Default, handler: { action in
                self.signalStrengthView.signal = .Low
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "Very Low", style: .Default, handler: { action in
                self.signalStrengthView.signal = .VeryLow
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "No Signal", style: .Default, handler: { action in
                self.signalStrengthView.signal = .NoSignal
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "Unknown", style: .Default, handler: { action in
                self.signalStrengthView.signal = .Unknown
            })
        )
        
        actionSheet.addAction(
            UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        )
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func flipButtonPressed(sender: AnyObject) {
        self.signalStrengthView.flipped = !self.signalStrengthView.flipped
    }
}

