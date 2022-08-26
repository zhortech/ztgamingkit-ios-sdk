# ZTGamingKit

[![Platforms](https://img.shields.io/cocoapods/p/ZTGamingKit.svg)](https://cocoapods.org/pods/ZTGamingKit)
[![License](https://img.shields.io/cocoapods/l/ZTGamingKit)](https://raw.githubusercontent.com/zhortech/ztgaming-ios-sdk/main/LICENSE)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/ZTGamingKit.svg)](https://cocoapods.org/pods/ZTGamingKit)

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 13.0+
- Xcode 11.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ZTGamingKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

pod 'ZTGamingKit', :git => "https://github.com/zhortech/ZTGamingKit-ios-sdk.git"
```
Please add post install script at the end of `Podfile` if there is problem to use  library:

```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use ZTGamingKit as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTGamingKit",
    dependencies: [
        .package(url: "https://github.com/zhortech/ZTGamingKit-ios-sdk.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "ZTGamingKit", dependencies: ["ZTGamingKit"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ZTGamingKit into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add ZTGamingKit as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/zhortech/ZTGamingKit-ios-sdk.git
$ git submodule update --init --recursive
```

- Open the new `ZTGamingKit` folder, and drag the `ZTGamingKit.xcframework` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see `ZTGamingKit.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `ZTGamingKit.framework`.

- And that's it!

> The `ZTGamingKit.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/zhortech/ZTGamingKit-ios-sdk/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `ZTGamingKit.framework`.
- And that's it!

</p></details>

## Usage

### Product setup
ZTGaming class should be instantiated to work.
 
### Activity data

#### Current Algo mode
Application can check current algo mode set on insoles by checking property `currentAlgoMode`. If mode is correct - it should be `gaming` 
```swift
ZTGaming.shared.currentAlgoMode
```

#### Realtime posture 
To obtain relatime posture you should subscribe to `onRealtimeMessageUpdated`. It will return message of type `ZTRealtimeMessage` and payload as byte array. 
Message has properties set depending on `eventType`. E.g. for `eventType == .realTimeMetrics` property `realtimeMetrics` will be set, for `eventType == .realTimeEvent` property `realtimeEvent` is set so motion and intensity can be checked. 
Payload can be used to parse additional information like metrics values.

```swift

ZTGaming.shared.onRealtimeMessageUpdated.subscribe(with: self) { (realtimeMessage, payload) in
    // To check metrics and its value
    if message.eventType == .realTimeMetrics {
        print("Activity type: \(message.realtimeMetrics?.activityType?.description ?? "")")
    }
    // To check motion which is part of event
    if message.eventType == .realTimeEvent, message.realtimeEvent?.eventType == .motion {
        print("Motion: \(message.realtimeEvent?.motionId?.description ?? "")")
        print("Intensity: \(message.realtimeEvent?.intensity?.description ?? "")")
    }
}

```

## Author

ZhorTech [@zhortech](https://twitter.com/zhortech)

## License

ZTGamingKit is released under the MIT license. See [LICENSE](https://github.com/zhortech/ztgaming-ios-sdk.git/blob/master/LICENSE) for details.
