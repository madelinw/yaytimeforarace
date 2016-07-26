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
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    
    @IBOutlet weak var mondayCaption: UILabel!
    @IBOutlet weak var tuesdayCaption: UILabel!
    @IBOutlet weak var wednesdayCaption: UILabel!
    @IBOutlet weak var thursdayCaption: UILabel!
    @IBOutlet weak var fridayCaption: UILabel!
    @IBOutlet weak var saturdayCaption: UILabel!
    @IBOutlet weak var sundayCaption: UILabel!
    
    let calendarData = CalendarData.calendarInstance
    var weeksFromDate : Int = 0
    
    var halfNewbie : [[Double]] = []
    var halfGentle : [[Double]] = []
    var halfEndurance : [[Double]] = []
    var halfSpeed : [[Double]] = []
    //var halfExtreme : [[Double]] = []
    //var fullNewbie : [[Double]] = []
    //var fullGentle : [[Double]] = []
    //var fullEndurance : [[Double]] = []
    //var fullSpeed : [[Double]] = []
    //var fullExtreme : [[Double]] = []
    
    //var schedule : [[Double]] = []
    var schedule : [String: [String : [[Double]]]] = [:]
    
    var currentWeek : [Double] = []
    var weekInSchedule : Int = 0
    var weekLabels : [UILabel] = []
    var weekCaptions : [UILabel] = []
    
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
        
        self.halfNewbie = [[0,3,2,3,0,30,4],
                           [0,3,2,3,0,30,4],
                           [0,3.5,2,3.5,0,40,5],
                           [0,3.5,2,3.5,0,40,5],
                           [0,4,2,4,0,40,6],
                           [0,4,2,4,0,0,3.1],
                           [0,4.5,3,4.5,0,50,7],
                           [0,4.5,3,4.5,0,50,8],
                           [0,5,3,5,0,0,6.2],
                           [0,5,3,5,0,60,9],
                           [0,5,3,5,0,60,10],
                           [0,4,3,2,0,0,13.1]]
        self.halfGentle = [[0,3,3,3,0,4,60],
                           [0,3,3,3,0,5,60],
                           [0,3,4,3,0,6,60],
                           [0,3,4,3,0,7,60],
                           [0,3,4,3,0,8,60],
                           [0,3,4,3,0,3.1,60],
                           [0,3,5,3,0,9,60],
                           [0,3,5,3,0,10,60],
                           [0,3,5,3,0,6.2,60],
                           [0,3,5,3,0,11,60],
                           [0,3,5,3,0,12,60],
                           [0,3,2,2,0,0,13.1]]
        self.halfEndurance = [[30,3,4,3,0,3,4],
                              [30,3,4,3,0,3,5],
                              [40,3.5,5,3.5,0,0,6],
                              [40,3.5,5,3.5,0,3,7],
                              [40,4,6,4,0,3,8],
                              [50,4,6,4,0,0,3.1],
                              [0,4.5,7,4.5,0,4,9],
                              [50,4.5,7,4.5,0,5,10],
                              [60,5,8,5,0,0,6.2],
                              [0,5,8,5,0,5,11],
                              [60,5,6,4,0,3,12],
                              [0,4,4,2,0,0,13.1]]
        self.halfSpeed = [[30,3,5.4001,3,0,3,5],
                          [30,3,30.9,3,0,3,6],
                          [40,3.5,6.4001,3,0,0,3.1],
                          [40,3.5,35.9,3,0,3,7],
                          [40,4,7.4001,3,0,3,8],
                          [50,4,40.9,3,0,0,6.2],
                          [0, 4.5,8.4001,3,0,4,9],
                          [50,4.5,40.9,3,0,5,10],
                          [60,5,9.4001,3,0,0,9.32],
                          [0, 5,45.9,3,0,5,11],
                          [60,5,10.4001,3,0,3,12],
                          [0, 4,30.9,2,0,0,13.1]]
        //self.halfExtreme = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]

        //self.fullNewbie = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,26.2]]
        //self.fullGentle = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]
        //self.fullEndurance = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]
        //self.fullSpeed = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]
        //self.fullExtreme = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]

        self.schedule = [
            "Half": ["Newbie": self.halfNewbie, "Gentle": self.halfGentle, "Endurance": self.halfEndurance, "Speed": self.halfSpeed]
        ]
        
        
        //self.schedule = [[0,3,3,3,0,4,3],[0,3,3,3,0,5,3],[0,3,4,3,0,6,3],[0,3,4,3,0,7,3],[0,3,4,3,0,8,3],[0,3,4,3,0,3.2,3],[0,3,5,3,0,9,3],[0,3,5,3,0,10,3],[0,3,5,3,0,6.4,3],[0,3,5,3,0,11,3],[0,3,5,3,0,12,3],[0,3,2,2,0,0,13.2]]
        self.weeksFromDate = self.weeksFrom(self.calendarData.timeToRace)
        
        if ((12 - self.weeksFromDate) <= 12 && (12 - self.weeksFromDate) >= 0) {
            self.weekInSchedule = 11 - self.weeksFromDate
        } else {
            self.weekInSchedule = 0
        }
        
        let currentDay = getDayOfWeek()
        
        self.currentWeek = self.schedule[self.calendarData.howFar]![self.calendarData.howPro]![weekInSchedule]
        
        
        //self.currentWeek = self.schedule[weekInSchedule]

        weekCountdownLabel.text = "\(self.weeksFromDate) Weeks Away!"
        
        mondayLabel.text    = String(format:"%g",self.currentWeek[0])
        tuesdayLabel.text    = String(format:"%g",self.currentWeek[1])
        wednesdayLabel.text   = String(format:"%g",self.currentWeek[2])
        thursdayLabel.text = String(format:"%g",self.currentWeek[3])
        fridayLabel.text  = String(format:"%g",self.currentWeek[4])
        saturdayLabel.text    = String(format:"%g",self.currentWeek[5])
        sundayLabel.text  = String(format:"%g",self.currentWeek[6])
        
        self.weekLabels = [mondayLabel, tuesdayLabel, wednesdayLabel, thursdayLabel, fridayLabel, saturdayLabel, sundayLabel]
        self.weekCaptions = [mondayCaption, tuesdayCaption, wednesdayCaption, thursdayCaption, fridayCaption, saturdayCaption, sundayCaption]
        
        for (index, caption) in self.weekLabels.enumerate() {
            switch caption.text {
            case "0"?:
                self.weekLabels[index].text = "rest"
                self.weekLabels[index].textColor = UIColor.grayColor()
                self.weekCaptions[index].text = ""
            case "30"?, "40"?, "50"?, "60"?:
                self.weekCaptions[index].text = "cross"
            case "5.4001"?, "6.4001"?, "7.4001"?, "8.4001"?, "9.4001"?, "10.4001"?:
                self.weekLabels[index].text = self.weekLabels[index].text!.componentsSeparatedByString(".")[0]
                self.weekCaptions[index].text = "x400\n" + "5k pace"
            case "30.9"?, "35"?, "40"?, "45"?:
                self.weekLabels[index].text = self.weekLabels[index].text!.componentsSeparatedByString(".")[0]
                self.weekCaptions[index].text = "min tempo"
            case "3.1"?, "6.2"?, "9.32"?, "13.1"?, "26.2"?:
                self.weekCaptions[index].text = "race!"
            default:
                self.weekCaptions[index].text = "miles"
            }
        }
        
        
        self.weekLabels[getDayOfWeek() - 1].textColor = UIColor.redColor()
        
        print(self.calendarData.timeToRace)
        print(self.weeksFromDate)
        print(currentDay)
        print(self.calendarData.howFar)
        print(self.calendarData.howPro)

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
