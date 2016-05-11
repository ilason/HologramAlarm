//
//  AlarmViewController.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/6/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    static let sharedInstance = AlarmViewController()
    
    let clock = Clock()
    var timer: NSTimer?
    

    
    @IBOutlet weak var topTimeLabel: UILabel!
    @IBOutlet weak var rightTimeLabel: UILabel!
    @IBOutlet weak var bottomTimeLabel: UILabel!
    @IBOutlet weak var leftTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transform()
        clearNavigationBar()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(AlarmViewController.updateTimeLabel), userInfo: nil, repeats: true)

        
//        topTimeLabel.center.y = view.bounds.minY
        
    }
    
     override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        topLabelAnimation()

        
        
        
//        UIView.animateWithDuration(10.0) {
//            self.topTimeLabel.center.y -= self.view.bounds.width
//        }
//        UIView.animateWithDuration(20.0) {
//            self.topTimeLabel.center.y += self.view.bounds.width
//        }
        
    }


    func topLabelAnimation() {
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.topTimeLabel.center.y -= self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(20.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.topTimeLabel.center.y += self.view.bounds.width
            }, completion: nil)
    }
    
    func transform() {
        bottomTimeLabel.transform = CGAffineTransformMakeRotation(3.14)
        rightTimeLabel.transform = CGAffineTransformMakeRotation(3.14/2)
        leftTimeLabel.transform = CGAffineTransformMakeRotation(3.14/(-2))
    }
    
    func clearNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true

    }
    func updateTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        bottomTimeLabel.text = formatter.stringFromDate(clock.currentTime)
        rightTimeLabel.text = formatter.stringFromDate(clock.currentTime)
        leftTimeLabel.text = formatter.stringFromDate(clock.currentTime)
        topTimeLabel.text = formatter.stringFromDate(clock.currentTime)
        
    }
    

}



