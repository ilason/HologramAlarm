//
//  ColorSettingsViewController.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/5/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class ColorSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var colorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ColorController.sharedInstance.colorNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("colorCell", forIndexPath: indexPath)
        cell.textLabel?.text = ColorController.sharedInstance.colorNames[indexPath.row]
        cell.imageView?.image = ColorController.sharedInstance.colorImages[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let color = ColorController.sharedInstance.colors[indexPath.row]
       colorLabel.textColor = color
        tableView.reloadData()
    }
}
