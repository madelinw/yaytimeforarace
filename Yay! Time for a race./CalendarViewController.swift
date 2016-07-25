//
//  CalendarViewController.swift
//  Yay! Time for a race.
//
//  Created by Madelin Woods on 7/23/16.
//  Copyright © 2016 Madelin Woods. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var weekCountdownLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    
    let calendarData = CalendarData.calendarInstance
    var weeksFromDate : Int = 0
    
    var schedule : [[Double]] = []
    var currentWeek : [Double] = []
    var weekInSchedule : Int = 0
    var weekLabels : [UILabel] = []
    
    func weeksFrom(date : NSDate) -> Int {
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: NSDate(), toDate: date, options: []).weekOfYear
    }
    
    func getDayOfWeek() -> Int {
        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let myComponents = myCalendar!.components(.Weekday, fromDate: todayDate)
        let weekDay = myComponents.weekday
        return weekDay
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.schedule = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]
        self.weeksFromDate = self.weeksFrom(self.calendarData.timeToRace)
        
        if ((12 - self.weeksFromDate) <= 12 && (12 - self.weeksFromDate) >= 0) {
            self.weekInSchedule = 11 - self.weeksFromDate
        } else {
            self.weekInSchedule = 0
        }
        
        let currentDay = getDayOfWeek()

        
        self.currentWeek = self.schedule[weekInSchedule]

        weekCountdownLabel.text = "\(self.weeksFromDate) Weeks Away!"
        
        sundayLabel.text    = String(format:"%g",self.currentWeek[0])
        mondayLabel.text    = String(format:"%g",self.currentWeek[1])
        tuesdayLabel.text   = String(format:"%g",self.currentWeek[2])
        wednesdayLabel.text = String(format:"%g",self.currentWeek[3])
        thursdayLabel.text  = String(format:"%g",self.currentWeek[4])
        fridayLabel.text    = String(format:"%g",self.currentWeek[5])
        saturdayLabel.text  = String(format:"%g",self.currentWeek[6])
        
        self.weekLabels = [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel, thursdayLabel, fridayLabel, saturdayLabel]
        
        self.weekLabels[getDayOfWeek() - 1].textColor = UIColor.redColor()
        
        print(self.calendarData.timeToRace)
        print(self.weeksFromDate)
        print(currentDay)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
