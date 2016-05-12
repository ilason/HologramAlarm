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
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var alarmButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var datePickerView: UIView!
    let alarm = Alarm()
    
    var alarmAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("clock alarm sound", ofType: "mp3")!)
    
    var buttonAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAudioPlayer = try!AVAudioPlayer(contentsOfURL: alarmAudioURL, fileTypeHint: nil)
        
        datePickerChanged()
        switchToAlarmNotSetView()
        //**********************//
        // MARK: - BUTTON STYLE//
        //*********************//
        
        alarmButton.layer.cornerRadius = 8
        alarmButton.layer.masksToBounds = true
        alarmButton.layer.borderWidth = 0.8
        colorButton.layer.cornerRadius = 8
        colorButton.layer.masksToBounds = true
        colorButton.layer.borderWidth = 0.8
        
        datePicker.minimumDate = NSDate()
        
        datePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        datePickerView.layer.cornerRadius = 12
        datePickerView.layer.masksToBounds = true
        datePickerView.layer.borderWidth = 1.4
        datePickerView.backgroundColor = UIColor(red: 0.502, green: 0.710, blue: 0.871, alpha: 1.00)
        
       self.view.backgroundColor = UIColor.blackColor()
        
        
        
        
        
        //****************************//
        // MARK: - CALL ALARM COMPLETE//
        //****************************//
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingsTableViewController.alarmComplete), name: Alarm.notificationComplete, object: nil)
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
    
    //**********************//
    // MARK: - SWITCH ALARM VIEW//
    // CHANGES VIEW WHEN ALARM IS SET, AND CANCELED.
    //*********************//
    
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
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .LongStyle
        
        messageLabel.text = "Your alarm is set!"
        
        if let date = alarm.alarmDate {
            dateLabel.text = "Set for \(dateFormatter.stringFromDate(date))"
            datePicker.date = date
        } else {
            dateLabel.text = ""
        }
        
        alarmButton.setTitle("Cacel Alarm", forState: .Normal)
        datePicker.userInteractionEnabled = false
    }
    
    func switchToAlarmNotSetView() {
        alarm.cancel()
        messageLabel.text = "Your alarm is not set."
        dateLabel.text = ""
        alarmButton.setTitle("Set Alarm", forState: .Normal)
        datePicker.minimumDate = NSDate()
        datePicker.userInteractionEnabled = true
        
    }
    
     func armAlarm() {
        alarm.arm(datePicker.date)
        switchToAlarmSetView()
    }

    func alarmComplete() {
        self.switchToAlarmNotSetView()
        buttonAudioPlayer.play()
        
    }
    
    //**********************//
    // MARK: - DATE PICKER//
    //CHANGES DETAIL LABEL IN DATE PICKER TO CURRENT ALARM SET TIME.
    //COLAPSES DATE PICKER WHEN CELL IS TAPPED.
    //*********************//
    
    @IBAction func datePickerValue(sender: AnyObject) {
        datePickerChanged()
    }
    
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




