//
//  ViewController.swift
//  Yay! Time for a race.
//
//  Created by Madelin Woods on 7/23/16.
//  Copyright © 2016 Madelin Woods. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var selectedItemsArray = []

    var lengthClasses = ["5k", "Half"]
    var fivekItems = ["Newbie", "Intermediate"]
    var halfItems =  ["Newbie","Gentle","Endurance","Speed"]
    
    let calendarData = CalendarData.calendarInstance
    var far : String = ""
    var pro : String = ""

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var lengthPicker: UIPickerView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelPicker: UIPickerView!
    
    @IBOutlet weak var goButton: UIButton!

    @IBAction func touchDownButton(sender: AnyObject) {
        // Change button text from "Ready, set" to "Go!"
        goButton.setTitle("Go!", forState: .Normal)
        
        // Update data passed to calendarData according to what's been selected
        self.calendarData.timeToRace = self.datePicker.date
        self.setPickerVariables()
        self.calendarData.howFar = self.far
        self.calendarData.howPro = self.pro
    }
    @IBAction func touchUpButton(sender: AnyObject) {
        
    }
    
    func setPickerVariables() {
        far = lengthClasses[lengthPicker.selectedRowInComponent(0)]
        pro = selectedItemsArray[levelPicker.selectedRowInComponent(0)] as! String
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set picker options based on data from calendarData
        self.lengthPicker.dataSource = self
        self.lengthPicker.delegate = self
        self.levelPicker.dataSource = self
        self.levelPicker.delegate = self

        lengthPicker.selectRow(0,
           inComponent: 0,
           animated: false)
        
        // Default to 5k
        selectedItemsArray = fivekItems
        self.setPickerVariables()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        //return lengthClasses.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == lengthPicker {
            return lengthClasses.count
        } else if pickerView == levelPicker {
            return selectedItemsArray.count
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == lengthPicker {
            return lengthClasses[row]
        } else if pickerView == levelPicker {
            return (selectedItemsArray[row] as! String)
        }
        return ""
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == lengthPicker {
            switch row {
            case 0:
                selectedItemsArray = fivekItems
            case 1:
                selectedItemsArray = halfItems
            default:
                selectedItemsArray = fivekItems
            }
            // IMPORTANT reload the data on the item picker
            levelPicker.reloadAllComponents()
            self.setPickerVariables()
        } else if pickerView == levelPicker {
            // Get the current item
            //let item = selectedItemsArray[row]
            
            self.setPickerVariables();
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
