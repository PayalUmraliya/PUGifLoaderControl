//
//  ViewController.swift
//  LoaderSample
//
//  Created by Payal on 13/11/18.
//  Copyright © 2018 Payal. All rights reserved.
//

import UIKit
import  PUGifLoading
class ViewController: UIViewController {
    //INIT LOADER CLASS OBJECT FIRST TO ACCESS ALL METHODS INSIDE IT
    let loading = PUGIFLoading()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnShowClicked(_ sender: Any)
    {
                loading.hide()
              //PU : - ADD TEXT YOU WANT TO SHOW AND PROVIDE GIF IMAGE NAME HERE AND IT MUST BE AVAILABLE IN PROJECT CODE
                loading.show("Loading", gifimagename: "foodloader")
                self.autohide()
        
    }
    @IBAction func btnShowActivityClicked(_ sender: Any)
    {
                loading.hide()
                loading.showWithActivityIndicator("Loading", activitycolor: UIColor.yellow, labelfontcolor:UIColor.yellow , labelfontsize: 16,activityStyle: UIActivityIndicatorViewStyle.whiteLarge)
                self.autohide()
    }
    func autohide()
    {
                let when = DispatchTime.now() + 10
                DispatchQueue.main.asyncAfter(deadline: when){
                    //PU:- TO HIDE THE LOADER
                    self.loading.hide()
                }
    }

}

