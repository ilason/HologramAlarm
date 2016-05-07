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


    @IBOutlet weak var topTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
