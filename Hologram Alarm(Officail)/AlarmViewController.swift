//
//  AlarmViewController.swift
//  Hologram Alarm(Officail)
//
//  Created by Aaron Eliason on 5/6/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable

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
        clearNavigationBar()
        transform()
}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(AlarmViewController.updateTimeLabel), userInfo: nil, repeats: true)

        
//        topTimeLabel.center.y = view.bounds.minY
        
    }
    
     override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        timeAnimation()
    }


    func timeAnimation() {
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.topTimeLabel.frame.origin = CGPointMake(self.topTimeLabel.frame.origin.x, -150)
            }, completion: nil)
        
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.bottomTimeLabel.frame.origin = CGPointMake(self.bottomTimeLabel.frame.origin.x, 275)
            }, completion: nil)
        
//        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
//            self.leftTimeLabel.frame.origin = CGPointMake(self.leftTimeLabel.frame.origin.x, 50)
//            }, completion: nil)

    }
    
    func transform() {
        //INVERSTS LABEL AND FLIPS THEM ACCORDINGLY//
        topTimeLabel.layer.transform = CATransform3DMakeRotation(3.14, 0.0, 1.0, 0.0)
        leftTimeLabel.layer.transform = CATransform3DMakeRotation(3.14, (2.0/(2)), 1.0, 0.0)
        rightTimeLabel.layer.transform = CATransform3DMakeRotation(3.14, (2.0/(-2)), 1.0, 0.0)
        bottomTimeLabel.layer.transform = CATransform3DMakeRotation(3.14, 90.0, 1.0, 0.0)
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



