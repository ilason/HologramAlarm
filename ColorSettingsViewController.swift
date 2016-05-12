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
    var alarmTimeView = AlarmViewController()
    let clock = Clock()
    var timer: NSTimer?


    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(AlarmViewController.updateWithTimeLabel), userInfo: nil, repeats: true)

        
        
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
        cell.textLabel?.textColor = UIColor(red: 0.502, green: 0.710, blue: 0.871, alpha: 1.00)
        cell.imageView?.image = ColorController.sharedInstance.colorImages[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let color = ColorController.sharedInstance.colors[indexPath.row]
        colorLabel.textColor = color
        (self.navigationController?.viewControllers.first as? AlarmViewController)?.labelColor = color
        tableView.reloadData()
    }
    func updateWithTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        colorLabel.text = formatter.stringFromDate(clock.currentTime)
    }
}
