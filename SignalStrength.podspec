#
# Be sure to run `pod lib lint SignalStrength.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SignalStrength"
  s.version          = "1.0.0"
  s.summary          = "iOS 7 inspirsed signal strength view."
  s.description      = "Display signal strength in your app using this iOS 7 inspired view. This is great for showing the RSSI of beacons, nearby bluetooth objects, or other devices."
  s.homepage         = "https://github.com/tannernelson/SignalStrength"
  s.screenshots     = "http://tanner.xyz/signal-strength-1.png"
  s.license          = 'MIT'
  s.author           = { "Tanner Nelson" => "tanner@bluebite.com" }
  s.source           = { :git => "https://github.com/tannernelson/SignalStrength.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/the_teet'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SignalStrength' => ['Pod/Assets/*.png']
  }
  s.frameworks = 'UIKit'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
