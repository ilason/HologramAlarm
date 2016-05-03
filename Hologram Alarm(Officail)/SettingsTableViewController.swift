//
//  SettingsTableViewController.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/2/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var alarmButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    let alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerChanged()
        switchToAlarmNotSetView()
        alarmButton.layer.cornerRadius = 8
        alarmButton.layer.masksToBounds = true
        alarmButton.layer.borderWidth = 0.8
        
        datePicker.minimumDate = NSDate()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingsTableViewController.switchToAlarmSetView), name: Alarm.notificationComplete, object: nil)
        guard let scheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else {
            return
        }
        alarm.cancel()
        for notification in scheduledNotifications {
            if notification.category == Alarm.categoryAlarm {
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                
                guard let fireDate = notification.fireDate else {return}
                alarm.arm(fireDate)
                switchToAlarmSetView()
            }
        }
    }
    func armAlarm() {
        alarm.arm(datePicker.date)
        switchToAlarmSetView()
    }
    
    @IBAction func alarmButtonTapped(sender: AnyObject) {
        if alarm.isArmed {
            alarm.cancel()
            switchToAlarmNotSetView()
        } else {
            armAlarm()
        }
    }
    
    func switchToAlarmSetView() {
        let dateFormatter = NSDateFormatter()
        
        messageLabel.text = "Your alarm is set!"
        
        if let date = alarm.alarmDate {
            dateLabel.text = dateFormatter.stringFromDate(date)
            datePicker.date = date
        } else {
            dateLabel.text = "Hello :)"
        }
        
        alarmButton.setTitle("Cacel Alarm", forState: .Normal)
        datePicker.userInteractionEnabled = false
    }
    
    
    
    func switchToAlarmNotSetView() {
        alarm.cancel()
        messageLabel.text = "Your alarm is not set."
        dateLabel.text = "Wanna set your alarm?"
        alarmButton.setTitle("Set Alarm", forState: .Normal)
        datePicker.minimumDate = NSDate()
        datePicker.userInteractionEnabled = true
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func datePickerValue(sender: AnyObject) {
        datePickerChanged()
    }
    
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //
    //        return 0
    //    }
    //
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //
    //        return 0
    //    }
    
    func datePickerChanged() {
        detailLabel.text = NSDateFormatter.localizedStringFromDate(datePicker.date, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            toggleDatePicker()
        }
    }
    var datePickerHidden = false
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if datePickerHidden && indexPath.section == 0 && indexPath.row == 1 {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    func toggleDatePicker() {
        datePickerHidden = !datePickerHidden
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
}
