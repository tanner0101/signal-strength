# SignalStrength

[![CI Status](http://img.shields.io/travis/Tanner Nelson/SignalStrength.svg?style=flat)](https://travis-ci.org/Tanner Nelson/SignalStrength)
[![Version](https://img.shields.io/cocoapods/v/SignalStrength.svg?style=flat)](http://cocoapods.org/pods/SignalStrength)
[![License](https://img.shields.io/cocoapods/l/SignalStrength.svg?style=flat)](http://cocoapods.org/pods/SignalStrength)
[![Platform](https://img.shields.io/cocoapods/p/SignalStrength.svg?style=flat)](http://cocoapods.org/pods/SignalStrength)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

UIKit

## Installation

SignalStrength is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SignalStrength"
```

## Usage

Add a view to your Storyboard and set the class to `SignalStrengthView`. The view is `@IBDesignable` so you should immediately see the dots and intrinsic sizing.

Add an outlet to your ViewController to modify the SignalStrengthView's `signal` and `flipped` properties.

### Signal

This `enum` property changes how many dots are filled in on the view. Use the example application provided in the CocoaPod to view how different SignalStrength values affect the view.

```swift
enum SignalStrength {
    case Excellent
    case VeryGood
    case Good
    case Low
    case VeryLow
    case NoSignal
    case Unknown

}
```

### Flipped

This `Bool` property changes from which side the dots will begin to fill in or empty. Setting flipped to true for right aligned views is recommended.

## Author

Tanner Nelson, <me@tanner.xyz>

## License

SignalStrength is available under the MIT license. See the LICENSE file for more info.