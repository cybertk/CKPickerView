# CKPickerView

> A UIPickerView drop-in replacement with support for titles and Selection Indicator customization.

[![CI Status](http://img.shields.io/travis/cybertk/CKPickerView.svg?style=flat)](https://travis-ci.org/cybertk/CKPickerView)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/CKPickerView.svg?style=flat)](http://cocoapods.org/pods/CKPickerView)
[![Platform](https://img.shields.io/cocoapods/p/CKPickerView.svg?style=flat)](http://cocoapods.org/pods/CKPickerView)

![screenshot 1](https://cloud.githubusercontent.com/assets/455809/9780931/41d37bec-57c1-11e5-8269-d9c34983f3a1.png)
![screenshot 2](https://cloud.githubusercontent.com/assets/455809/9780934/5074bcf6-57c1-11e5-982f-0c9f8ef37283.png)

## Features

- Add **Titles** on top of UIPickerView thru
    - `titles` for simple strings
    - `attributedTitles` for attributed strings
    - `titleView` for fully customized title view
- Ability to update **Selection Indicator Color** thru `selectionIndicatorColor`
- Ability to update **Selection View's Background Color** thru `selectionBackgroundColor`

## Getting started

CKPickerView is a drop-in replacement of UIPickerView with extra APIs, so you can treat CKPickerView as UIPickerView, like

```swift
import CKPickerView

let picker = CKPickerView()
// Set picker title
picker.titles = ["Title"]
// Set selection view's background color
picker.selectionBackgroundColor = UIColor.blackColor()
// Set seliection indicator's color
picker.selectionIndicatorColor = UIColor.whiteColor()
```

You can also run the example project, by cloning the repo, and open `Example` target within Xcode.

## Requirements

- iOS 8.0 and above
- Xcode 7.0 and above

## Installation

### Carthage

CKPickerView is available through [Carthage](https://github.com/carthage/carthage). To install it, simply add the following line to your Cartfile:

```
github "cybertk/CKPickerView"
```

### Cocoapods

CKPickerView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CKPickerView"
```

## Author

@cybertk

## License

CKPickerView is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
