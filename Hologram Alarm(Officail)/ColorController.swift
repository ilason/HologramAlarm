//
//  Color.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/2/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class ColorController {
    static let sharedInstance = ColorController()
    
    var colorNames = ["Red", "Cherry", "Orange", "Honey", "Yellow", "Honeydew", "Mint", "Green", "Cyan", "Blue", "Purple", "Royal", "Pink"]
    
    var colorImages = [UIImage(named: "red"), UIImage(named: "cherryred"), UIImage(named: "Orange"), UIImage(named: "Honey"), UIImage(named: "yellow"), UIImage(named: "honeydew"), UIImage(named: "mint"), UIImage(named: "green"), UIImage(named: "cyan"), UIImage(named: "blue"), UIImage(named: "purple"), UIImage(named: "royal"), UIImage(named: "pink")]
    
    var colors: [UIColor] = [UIColor.alarmRed(), UIColor.alarmCherryRed(), UIColor.alarmOrange(), UIColor.alarmHoney(), UIColor.alarmYellow(),UIColor.alarmHoneydew(), UIColor.alarmMint(), UIColor.alarmGreen(), UIColor.alarmCyan(), UIColor.alarmBlue(), UIColor.alarmPurple(), UIColor.alarmRoyal(), UIColor.alarmPink()]
    
}