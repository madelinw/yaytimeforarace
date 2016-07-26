//
//  ViewController.swift
//  Yay! Time for a race.
//
//  Created by Madelin Woods on 7/23/16.
//  Copyright © 2016 Madelin Woods. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let pickerData = [
        ["Half"], //,"Full"],
        ["Newbie","Gentle","Endurance","Speed"] //,"Extreme"]
    ]
    let calendarData = CalendarData.calendarInstance
    var farComponent : Int = 0
    var proComponent : Int = 0
    var far : String = ""
    var pro : String = ""
    
    enum PickerComponent:Int {
        case far = 0
        case pro = 1
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var destinyLabel: UILabel!
    @IBOutlet weak var destinyPicker: UIPickerView!
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
        farComponent = PickerComponent.far.rawValue
        proComponent = PickerComponent.pro.rawValue
        far = pickerData[farComponent][destinyPicker.selectedRowInComponent(farComponent)]
        pro = pickerData[proComponent][destinyPicker.selectedRowInComponent(proComponent)]
    }
    
    func updateLabel(){
        // Show current selection in a fancy helper label
        self.setPickerVariables()
        destinyLabel.text = far + " marathon — " + pro + " level"
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set picker options based on data from calendarData
        destinyPicker.delegate = self
        destinyPicker.dataSource = self
        
        destinyPicker.selectRow(2,
           inComponent: PickerComponent.far.rawValue,
           animated: false)
        updateLabel()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
