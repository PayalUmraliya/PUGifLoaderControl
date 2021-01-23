# PUGifLoading

[![CI Status](https://img.shields.io/travis/PayalUmraliya/PUGifLoading.svg?style=flat)](https://travis-ci.org/PayalUmraliya/PUGifLoading)
[![Version](https://img.shields.io/cocoapods/v/PUGifLoading.svg?style=flat)](https://cocoapods.org/pods/PUGifLoading)
[![License](https://img.shields.io/cocoapods/l/PUGifLoading.svg?style=flat)](https://cocoapods.org/pods/PUGifLoading)
[![Platform](https://img.shields.io/cocoapods/p/PUGifLoading.svg?style=flat)](https://cocoapods.org/pods/PUGifLoading)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Example project output

<img src="https://github.com/PayalUmraliya/PUGifLoaderControl/blob/master/projectoutput.gif" width="240" height="500" />

## Requirements

## Installation

PUGifLoading is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PUGifLoading'
```

## Install Using Framework follow this link

https://github.com/PayalUmraliya/PUGifLoaderControl.git

#### USAGE

#### Showing the Loader

Import the control 

```
import PUGifLoading
```

Create an object for this control

```
let loading = PUGIFLoading()
```

You can show the status of indeterminate tasks using one of the following ( GIF Or Activity indicator):

##### GIF Loader view - You can use any gif image according to your need.

```
loading.show("Loading", gifimagename: "foodloader")
```

* ###### Above function take 2 parameters
* 1 - Text to display 
* 2 - Name of gif image to show in loader

##### Activity indicator Loader view

```
loading.showWithActivityIndicator("Loading", activitycolor: UIColor.yellow, labelfontcolor:UIColor.yellow , labelfontsize: 16.0,activityStyle: UIActivityIndicatorViewStyle.whiteLarge)
```

* ###### Above function take 5 parameters
* 1 - Text to display 
* 2 - activitycolor - color of indicator
* 3 - labelfontcolor - color of label
* 4 - labelfontsize - font size of text to display
* 5 - activityStyle - UIActivityIndicatorViewStyle of activity indicator

#### Hiding the Loader

```
loading.hide()
```


## Author

PayalUmraliya, behappy78600@gmail.com

## License

PUGifLoading is available under the MIT license. See the LICENSE file for more info.
