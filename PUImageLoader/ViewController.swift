//
//  ViewController.swift
//  PUImageLoader
//
//  Created by C68 on 8/23/17.
//  Copyright © 2017 PayalUmraliya. All rights reserved.
//

import UIKit
import PUGifLoderControl
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func btnShowClicked(_ sender: Any)
    {
         PUImageLoaderView.hide()
       PUImageLoaderView.show("Loading", gifimagename: "foodloader")
       self.autohide()
      
    }
    @IBAction func btnShowActivityClicked(_ sender: Any)
    {
         PUImageLoaderView.hide()
        PUImageLoaderView.showWithActivityIndicator("Loading", activitycolor: UIColor.yellow, labelfontcolor:UIColor.yellow , labelfontsize: 16.0,activityStyle: UIActivityIndicatorViewStyle.whiteLarge)
        self.autohide()
    }
    func autohide()
    {
        let when = DispatchTime.now() + 10
        DispatchQueue.main.asyncAfter(deadline: when){
            PUImageLoaderView.hide()
        }
    }
}

