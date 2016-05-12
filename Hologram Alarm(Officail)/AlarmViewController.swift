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
    
    var progromaticTopLabel: UILabel!
    var progromaticBottomLabel: UILabel!
    var progromaticLeftLabel: UILabel!
    var progromaticRightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearNavigationBar()
        createLabels()
        transform()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(AlarmViewController.updateWithTimeLabel), userInfo: nil, repeats: true)
        framesForLabels()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        timeAnimation()
        
    }

    
    func framesForLabels() {
        self.progromaticTopLabel.frame = CGRectMake(view.center.x - 70, view.center.y - 155, 140, 140)
        self.progromaticBottomLabel.frame = CGRectMake(view.center.x - 70, view.center.y + 45, 140, 140)
        self.progromaticLeftLabel.frame = CGRectMake(view.center.x - 120, view.center.y - 60, 140, 140)
        self.progromaticRightLabel.frame = CGRectMake(view.center.x - 10, view.center.y - 60, 140, 140)
    }
    
    func createLabels() {
        
        // Creates Label
        self.progromaticTopLabel = UILabel()
        self.progromaticBottomLabel = UILabel()
        self.progromaticLeftLabel = UILabel()
        self.progromaticRightLabel = UILabel()
        //Sets Default Color
        progromaticBottomLabel.textColor = .whiteColor()
        progromaticTopLabel.textColor = .whiteColor()
        progromaticLeftLabel.textColor = .whiteColor()
        progromaticRightLabel.textColor = .whiteColor()
        
        //Centers Text
        progromaticBottomLabel.textAlignment = .Center
        progromaticTopLabel.textAlignment = .Center
        progromaticLeftLabel.textAlignment = .Center
        progromaticRightLabel.textAlignment = .Center
        //Gives Text
        progromaticTopLabel.text = ""
        progromaticBottomLabel.text = ""
        progromaticLeftLabel.text = ""
        progromaticRightLabel.text = ""
        //Adjust Font
        progromaticTopLabel.font = progromaticTopLabel.font.fontWithSize(32.0)
        progromaticBottomLabel.font = progromaticBottomLabel.font.fontWithSize(32.0)
        progromaticLeftLabel.font = progromaticLeftLabel.font.fontWithSize(32.0)
        progromaticRightLabel.font = progromaticRightLabel.font.fontWithSize(32.0)

        //Puts it into view
        view.addSubview(progromaticBottomLabel)
        view.addSubview(progromaticTopLabel)
        view.addSubview(progromaticLeftLabel)
        view.addSubview(progromaticRightLabel)

    }
    
    var labelColor: UIColor = .whiteColor() {
        didSet {
            progromaticTopLabel.textColor = labelColor
            progromaticBottomLabel.textColor = labelColor
            progromaticLeftLabel.textColor = labelColor
            progromaticRightLabel.textColor = labelColor
        }
    }
    func timeAnimation() {
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.progromaticTopLabel.frame.origin = CGPointMake(self.progromaticTopLabel.frame.origin.x, self.progromaticTopLabel.frame.origin.y - 150)
            }, completion: nil)
        
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.progromaticBottomLabel.frame.origin = CGPointMake(self.progromaticBottomLabel.frame.origin.x, self.progromaticBottomLabel.frame.origin.y + 150)
            }, completion: nil)
        
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.progromaticLeftLabel.frame.origin = CGPointMake(self.progromaticLeftLabel.frame.origin.x - 130, self.progromaticLeftLabel.frame.origin.y - (self.progromaticLeftLabel.frame.height - self.progromaticLeftLabel.frame.width)/2)
            }, completion: nil)
        
        UIView.animateWithDuration(10.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.progromaticRightLabel.frame.origin = CGPointMake(self.progromaticRightLabel.frame.origin.x + 130, self.progromaticRightLabel.frame.origin.y + (self.progromaticRightLabel.frame.height - self.progromaticRightLabel.frame.width)/2)
            }, completion: nil)

    }
    
    func transform() {
        //INVERSTS LABEL AND FLIPS THEM ACCORDINGLY//
        progromaticTopLabel.layer.transform = CATransform3DMakeRotation(3.14, 0.0, 1.0, 0.0)
        progromaticLeftLabel.layer.transform = CATransform3DMakeRotation(3.14, (2.0/(2)), 1.0, 0.0)
        progromaticRightLabel.layer.transform = CATransform3DMakeRotation(3.14, (2.0/(-2)), 1.0, 0.0)
        progromaticBottomLabel.layer.transform = CATransform3DMakeRotation(3.14, 200.2, 1.0, 0.0)
    }
    
    func clearNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true

    }
    func updateWithTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        progromaticBottomLabel.text = formatter.stringFromDate(clock.currentTime)
        progromaticRightLabel.text = formatter.stringFromDate(clock.currentTime)
        progromaticLeftLabel.text = formatter.stringFromDate(clock.currentTime)
        progromaticTopLabel.text = formatter.stringFromDate(clock.currentTime)
   
        
    }
    

}



