//
//  PUGifLoading.swift
//  Pods
//
//  Created by Payal on 13/11/18.
//

import Foundation
import UIKit
public class PUGIFLoading
{
    public var recentOverlay : UIView?
    public var recentOverlayTarget : UIView?
    public var recentLoadingText: String?
    public init() {}
    public func Color_RGBA(_ R: Int,_ G: Int,_ B: Int,_ A: Int) -> UIColor
    {
        return UIColor(red: CGFloat(R)/255.0, green: CGFloat(G)/255.0, blue: CGFloat(B)/255.0, alpha :CGFloat(A))
    }
    public func FontWithSize(_ fname: String,_ fsize: Int) -> UIFont
    {
        return UIFont(name: fname, size: CGFloat(fsize))!
    }
    
    public func hide() {
        if recentOverlay != nil
        {
            NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
            recentOverlay?.removeFromSuperview()
            recentOverlay =  nil
            recentLoadingText = nil
            recentOverlayTarget = nil
        }
    }
    
    public func show(_ loadingText : String?, gifimagename: String?)
    {
        hide()
        let overlayvw = UIApplication.shared.keyWindow!
        let overlay = UIView(frame: overlayvw.frame)
        overlay.center = overlayvw.center
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlayvw.addSubview(overlay)
        overlayvw.bringSubviewToFront(overlay)
        
        let jeremyGif = UIImage.gifImageWithName(name: gifimagename!)
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 50.0, width: 40, height: 40)
        overlay.addSubview(imageView)
        imageView.center = overlay.center;
        
        let label = UILabel()
        if let textString = loadingText
        {
            label.text = textString
            label.textColor = Color_RGBA(214, 144, 5, 1)
            label.font = FontWithSize("Verdana", 10)
            label.sizeToFit()
            label.center = CGPoint(x: imageView.center.x, y: imageView.center.y + 30)
            overlay.addSubview(label)
        }
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay.alpha = overlay.alpha > 0 ? 0 : 0.7
        UIView.commitAnimations()
        recentOverlay = overlay
        recentOverlayTarget = overlayvw
        recentLoadingText = loadingText
    }
    public func showWithActivityIndicator(_ loadingText:String?, activitycolor: UIColor, labelfontcolor:UIColor , labelfontsize: Int,activityStyle: UIActivityIndicatorView.Style)
    {
        hide()
        let overlayvw = UIApplication.shared.keyWindow!
        let overlay = UIView(frame: overlayvw.frame)
        overlay.center = overlayvw.center
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlayvw.addSubview(overlay)
        overlayvw.bringSubviewToFront(overlay)
        
        let indicator = UIActivityIndicatorView(style: activityStyle)
        indicator.color = activitycolor
        indicator.center = overlay.center
        indicator.startAnimating()
        overlay.addSubview(indicator)
        
        let label = UILabel()
        if let textString = loadingText
        {
            label.text = textString
            label.textColor = labelfontcolor
            label.font = FontWithSize("Verdana", labelfontsize)
            label.sizeToFit()
            label.center = CGPoint(x: indicator.center.x, y: indicator.center.y + 30)
            overlay.addSubview(label)
        }
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay.alpha = overlay.alpha > 0 ? 0 : 0.7
        UIView.commitAnimations()
        recentOverlay = overlay
        recentOverlayTarget = overlayvw
        recentLoadingText = loadingText
    }
}
extension UIImage
{
    public class func gifImageWithData(data: NSData) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data, nil) else {
            print("image doesn't exist")
            return nil
        }
        return UIImage.animatedImageWithSource(source: source)
    }
    
    public class func gifImageWithURL(gifUrl:String) -> UIImage? {
        guard let bundleURL = NSURL(string: gifUrl)
            else {
                print("image named \"\(gifUrl)\" doesn't exist")
                return nil
        }
        guard let imageData = NSData(contentsOf: bundleURL as URL) else {
            print("image named \"\(gifUrl)\" into NSData")
            return nil
        }
        
        return gifImageWithData(data: imageData)
    }
    
    public class func gifImageWithName(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
            .url(forResource: name, withExtension: "gif") else {
                print("SwiftGif: This image named \"\(name)\" does not exist")
                return nil
        }
        
        guard let imageData = NSData(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gifImageWithData(data: imageData)
    }
    
    public class func delayForImageAtIndex(index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionary = unsafeBitCast(CFDictionaryGetValue(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()), to: CFDictionary.self)
        
        var delayObject: AnyObject = unsafeBitCast(CFDictionaryGetValue(gifProperties, Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()), to: AnyObject.self)
        
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1
        }
        
        return delay
    }
    
    public class func gcdForPair(a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        if a! < b! {
            let c = a!
            a = b!
            b = c
        }
        
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b!
            } else {
                a = b!
                b = rest
            }
        }
    }
    
   public class func gcdForArray(array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(a: val, gcd)
        }
        
        return gcd
    }
    
    public class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            let delaySeconds = UIImage.delayForImageAtIndex(index: Int(i), source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        let gcd = gcdForArray(array: delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        let animation = UIImage.animatedImage(with: frames, duration: Double(duration) / 1000.0)
        
        return animation
    }
}
