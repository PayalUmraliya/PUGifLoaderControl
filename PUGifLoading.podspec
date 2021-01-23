#
# Be sure to run `pod lib lint PUGifLoading.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PUGifLoading'
  s.version          = '0.1.3'
  s.summary          = 'Clean and easy-to-use and light weight loader meant to display the progress of an ongoing task on iOS'
  s.swift_version = "4.2"
  s.description      = <<-DESC
									PUGifLoaderSource
									PUGifLoader swift with source code
									Alternative of https://github.com/PayalUmraliya/PUGifLoaderControl
									If anybody have issue in framework import then they can use this source code instead of framework.
									PUGifLoader is a clean and easy-to-use and light weight loader meant to display the progress of an ongoing task on iOS.
									You can show the status of indeterminate tasks using one of the following ( GIF Or Activity indicator):
									=== > GIF Loader view - You can use any gif image according to your need.
									PuLoadingView.show("Loading", gifimagename: "foodloader")
									=== > Activity indicator Loader view
									PuLoadingView.showWithActivityIndicator("Loading", activitycolor: UIColor.yellow, labelfontcolor:UIColor.yellow , labelfontsize: 16.0,activityStyle: UIActivityIndicatorViewStyle.whiteLarge)
									=== > Hiding the Loader
									PuLoadingView.hide()
									:)
                       				DESC

  s.homepage         = 'https://github.com/PayalUmraliya/PUGifLoading'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PayalUmraliya' => 'behappy78600@gmail.com' }
  s.source           = { :git => 'https://github.com/PayalUmraliya/PUGifLoading.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'

  s.source_files = 'PUGifLoading/Classes/**/*'
end
