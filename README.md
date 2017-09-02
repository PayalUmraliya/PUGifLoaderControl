# PUGifLoaderControl


PUGifLoaderControl is a clean and easy-to-use loader meant to display the progress of an ongoing task on iOS

### LICENSE

### Sample project output

### Installation Manually

* Drag the **PUGifLoderControl/PUGifLoderControl.framework** folder into your project.

* #### How to Embed binary 
  * Open the app's Xcode project or workspace.
  * Go to the app target's General configuration page.
  * Add the framework target to the Embedded Binaries section by clicking the Add icon, highlighted in Figure below.
  * Select your framework from the list of binaries that can be embedded
  For more info for embed binary please refer this link [How to embedd a framework (https://developer.apple.com/library/content/technotes/tn2435/_index.html)

#### USAGE


#### Showing the Loader

Import the control 

```
import PUGifLoderControl
```

You can show the status of indeterminate tasks using one of the following ( GIF Or Activity indicator):

##### GIF Loader view

```
PUImageLoaderView.show("Loading", gifimagename: "foodloader")
```

* ###### Above function take 2 parameters
* 1 - Text to display 
* 2 - Name of gif image to show in loader

##### Activity indicator Loader view

```
PUImageLoaderView.showWithActivityIndicator("Loading", activitycolor: UIColor.yellow, labelfontcolor:UIColor.yellow , labelfontsize: 16.0,activityStyle: UIActivityIndicatorViewStyle.whiteLarge)
```

* ###### Above function take 5 parameters
* 1 - Text to display 
* 2 - activitycolor - color of indicator
* 3 - labelfontcolor - color of label
* 4 - labelfontsize - font size of text to display
* 5 - activityStyle - UIActivityIndicatorViewStyle of activity indicator

:)
