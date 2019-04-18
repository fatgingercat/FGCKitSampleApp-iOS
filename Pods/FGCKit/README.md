# FGCKitSampleApp
Sample App usig FGCKit pod


## Requirements

- iOS 9.0+
- Xcode 8.3+
- Swift 3.1+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build FGCKit 1.0+.

To integrate FGCKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'FGCKit', '~> 1.0.15'
end
```

Then, run the following command:

```bash
$ pod install --repo-update
```
