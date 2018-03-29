[![Codacy Badge](https://api.codacy.com/project/badge/Grade/398671e67d944f50a812b52508941451)](https://www.codacy.com/app/tejas-ardeshna/TJLayoutHelper?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=tejas-ardeshna/TJLayoutHelper&amp;utm_campaign=Badge_Grade)
[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# TJLayoutHelper
NSLayoutConstraint extension for pixel perfect designs

## Features

- [x] Change constraint size according to device ratio
- [x] Change constraint value for specific device size

## Requirements

- iOS 10.0+
- Xcode 8.0

## Installation

#### Manually

Add TJLayoutHelper to your project

##### Programatically
```swift
@IBOutlet weak var consBlueViewTop: TJLayoutHelper!
func modifyConstraintAccordingToScreenSize()
{
   // Apply ratio
    consBlueViewTop.applyRatio   = true
    // OR add space for specific screen size
    consBlueViewTop.inch5_5Space = 20
    consBlueViewTop.XSpace       = 30
}

```

##### From story board
![Alt Text](https://github.com/tejas-ardeshna/TJLayoutHelper/blob/develop/top_constraint_with_TJLayoutHelper.gif)

## TODO
- [x] Add support for landscape orientation

## Caution

Don't use apply ratio and extra space togather

## Contribute

We would love you for the contribution to **TJLayoutHelper**, check the ``LICENSE`` file for more info.

## Author

Tejas Ardeshna – [@tejas_ardeshna](https://twitter.com/tejas_ardeshna), 
iOS developer at [Simform solutoions PVT. LTD.](https://github.com/simformsolutions)

Distributed under the MIT license. See ``LICENSE`` for more information.

[swift-image]:https://img.shields.io/badge/swift-4-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://github.com/tejas-ardeshna/TJProfileImage/blob/master/LICENSE.md
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
