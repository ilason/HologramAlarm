//
//  SettingsTableViewController.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/2/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

@IBDesignable
class SettingsTableViewController: UITableViewController{
    
    static let sharedInstance = SettingsTableViewController()
    
    @IBOutlet weak var haveHologramButton: UIButton!

    @IBOutlet weak var colorButton: UIButton!
//    let alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnTap = false


        //**********************//
        // MARK: - BUTTON STYLE//
        //*********************//
        
        colorButton.layer.cornerRadius = 8
        colorButton.layer.masksToBounds = true
        colorButton.layer.borderWidth = 0.8
        haveHologramButton.layer.cornerRadius = 8
        haveHologramButton.layer.masksToBounds = true
        haveHologramButton.layer.borderWidth = 0.8
        
        self.view.backgroundColor = UIColor.blackColor()
        
    }
    
    
    @IBAction func haveHologramButtonTapped(sender: AnyObject) {

        UIApplication.sharedApplication().openURL(NSURL(string:  "http://uptimeshop.us")!)
    }
    
    
}




