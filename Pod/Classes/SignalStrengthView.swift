//
//  SignalStrengthView.swift
//  Decode
//
//  Created by Tanner Nelson on 7/17/15.
//  Copyright (c) 2015 Blue Bite. All rights reserved.
//

import UIKit

@IBDesignable
public class SignalStrengthView: UIView {
    
    //MARK: Interace
    var dot1: SignalStrengthDotView!
    var dot2: SignalStrengthDotView!
    var dot3: SignalStrengthDotView!
    var dot4: SignalStrengthDotView!
    var dot5: SignalStrengthDotView!
    
    //MARK: Properties
    public var color = UIColor.blackColor() {
        didSet {
            self.update()
        }
    }
    
    public var signal: SignalStrength = .Unknown {
        didSet {
            self.update()
        }
    }
    public var flipped: Bool = true
    
    //MARK: Enumerations
    public enum SignalStrength {
        case Excellent
        case VeryGood
        case Good
        case Low
        case VeryLow
        case NoSignal
        case Unknown
    }
    
    //MARK: Lifecycle
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.initializeDots()
        self.update()
    }
    
    //MARK: Initialize
    func initializeDots() {
        self.dot1 = SignalStrengthDotView.addAfter(self, inView: self)
        self.dot2 = SignalStrengthDotView.addAfter(self.dot1, inView: self)
        self.dot3 = SignalStrengthDotView.addAfter(self.dot2, inView: self)
        self.dot4 = SignalStrengthDotView.addAfter(self.dot3, inView: self)
        self.dot5 = SignalStrengthDotView.addAfter(self.dot4, inView: self, lastView: self)
    }
    
    //MARK: Functions
    func update() {
        if dot1 == nil {
            //attempt to update before initialization
            return
        }
        
        dot1.color = self.color
        dot2.color = self.color
        dot3.color = self.color
        dot4.color = self.color
        dot5.color = self.color
        
        dot1.on = true
        dot2.on = true
        dot3.on = true
        dot4.on = true
        dot5.on = true
        
        switch self.signal {
        case .Excellent:
            break
        case .VeryGood:
            if self.flipped {
                dot1.on = false
            } else {
                dot5.on = false
            }
        case .Good:
            if self.flipped {
                dot1.on = false
                dot2.on = false
            } else {
                dot5.on = false
                dot4.on = false
            }
        case .Low:
            if self.flipped {
                dot1.on = false
                dot2.on = false
            } else {
                dot5.on = false
                dot4.on = false
            }
            dot3.on = false
        case .VeryLow:
            
            if self.flipped {
                dot1.on = false
            } else {
                dot5.on = false
            }
            dot4.on = false
            dot3.on = false
            dot2.on = false
            
        case .NoSignal, .Unknown:
            dot5.on = false
            dot4.on = false
            dot3.on = false
            dot2.on = false
            dot1.on = false
        }
    }
    
    //MARK: Designable
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.awakeFromNib()
    }
    
}


class SignalStrengthDotView: UIView {
    
    //MARK: Properties
    static let size: CGFloat = 6
    static let spacing: CGFloat = 2
    var on: Bool = true {
        didSet {
            self.update()
        }
    }
    
    var color = UIColor.blackColor() {
        didSet {
            self.update()
        }
    }
    
    //MARK: Class
    class func addAfter(leadingView: UIView, inView: UIView) -> SignalStrengthDotView {
        return self.addAfter(leadingView, inView: inView, lastView: nil)
    }
    
    class func addAfter(leadingView: UIView, inView superview: UIView, lastView: UIView?) -> SignalStrengthDotView {
        let dot = SignalStrengthDotView()
        
        
        dot.layer.borderColor = UIColor.blackColor().CGColor
        dot.layer.borderWidth = 0.5
        
        dot.on = false
        dot.translatesAutoresizingMaskIntoConstraints = false
        
        superview.addSubview(dot)
        
        dot.layer.cornerRadius = size / 2
        
        dot.addConstraint(
            NSLayoutConstraint(item: dot, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: size)
        )
        dot.addConstraint(
            NSLayoutConstraint(item: dot, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1, constant: size)
        )
        
        superview.addConstraint(
            NSLayoutConstraint(item: superview, attribute: .Top, relatedBy: .Equal, toItem: dot, attribute: .Top, multiplier: 1, constant: 0)
        )
        superview.addConstraint(
            NSLayoutConstraint(item: superview, attribute: .Bottom, relatedBy: .Equal, toItem: dot, attribute: .Bottom, multiplier: 1, constant: 0)
        )
        
        if leadingView == superview {
            superview.addConstraint(
                NSLayoutConstraint(item: dot, attribute: .Left, relatedBy: .Equal, toItem: leadingView, attribute: .Left, multiplier: 1, constant: 0)
            )
        } else {
            superview.addConstraint(
                NSLayoutConstraint(item: dot, attribute: .Left, relatedBy: .Equal, toItem: leadingView, attribute: .Right, multiplier: 1, constant: spacing)
            )
        }
        
        if let lastView = lastView {
            superview.addConstraint(
                NSLayoutConstraint(item: lastView, attribute: .Right, relatedBy: .Equal, toItem: dot, attribute: .Right, multiplier: 1, constant: 0)
            )
        }
        
        return dot
    }
    
    //MARK: Functions
    func update() {
        self.layer.borderColor = self.color.CGColor
        
        if self.on {
            self.backgroundColor = self.color
        } else {
            self.backgroundColor = UIColor.clearColor()
        }
    }
    
}