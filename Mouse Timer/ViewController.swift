//
//  ViewController.swift
//  Mouse Timer
//
//  Created by Wesley Moy on 3/3/16.
//  Copyright © 2016 Wesley Moy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timetime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(0.5), target: self, selector: Selector("foo"), userInfo: nil, repeats: true).fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func foo() {
        let components = NSDateComponents()
        components.year = 2016
        components.month = 3
        components.day = 22
        components.hour = 16
        components.minute = 45
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let destination = calendar.dateFromComponents(components)!
        let formatter = NSDateComponentsFormatter()
        let intervalComponents = calendar.components([.Day, .Hour, .Minute, .Second], fromDate: NSDate(), toDate: destination, options: NSCalendarOptions())
        let strstr = formatter.stringFromDateComponents(intervalComponents)
        dispatch_async(dispatch_get_main_queue()) {
            self.timetime.text = strstr
        }
    }
}

