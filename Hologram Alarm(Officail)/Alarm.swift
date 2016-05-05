//
//  Alarm.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/2/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import AudioToolbox

class Alarm: NSObject {
    static let categoryAlarm = "categoryAlarm"
    static let notificationComplete = "notificationComplete"
    
    private(set) var alarmDate: NSDate?
    
    var isArmed: Bool {
        get {
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    private var localNotification: UILocalNotification?
    
    func arm(fireDate: NSDate) {
        
        
        
        alarmDate = fireDate
        
        let alarmNotificaion = UILocalNotification()
        alarmNotificaion.fireDate = secondsOnly(fireDate)
        alarmNotificaion.timeZone = NSTimeZone.localTimeZone()
        alarmNotificaion.alertBody = "Alarm Complete"
        alarmNotificaion.category = Alarm.categoryAlarm
        
        UIApplication.sharedApplication().scheduleLocalNotification(alarmNotificaion)
        localNotification = alarmNotificaion
        
    }
    
    func cancel() {
        if isArmed {
            alarmDate = nil
            if let localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
    static func alarmComplete() {
        NSNotificationCenter.defaultCenter().postNotificationName(Alarm.notificationComplete, object: nil)
    }
    func secondsOnly(date: NSDate) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.stringFromDate(date)
        let newDate = dateFormatter.dateFromString(str)!
        
        return newDate
    }
}