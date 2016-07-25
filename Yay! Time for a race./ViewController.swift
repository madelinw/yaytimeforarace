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
        ["Half","Full"],
        ["Newbie","Gentle","Endurance","Speed","Extreme"]
    ]
    let calendarData = CalendarData.calendarInstance
    
    enum PickerComponent:Int {
        case far = 0
        case pro = 1
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var destinyLabel: UILabel!
    @IBOutlet weak var destinyPicker: UIPickerView!
    @IBOutlet weak var goButton: UIButton!

    @IBAction func touchDownButton(sender: AnyObject) {
        goButton.setTitle("Go!", forState: .Normal)
        self.calendarData.timeToRace = self.datePicker.date
    }
    @IBAction func touchUpButton(sender: AnyObject) {
        
    }
    
    
    func updateLabel(){
        var farComponent = PickerComponent.far.rawValue
        let proComponent = PickerComponent.pro.rawValue
        let far = pickerData[farComponent][destinyPicker.selectedRowInComponent(farComponent)]
        let pro = pickerData[proComponent][destinyPicker.selectedRowInComponent(proComponent)]
        destinyLabel.text = far + " marathon — " + pro + " level"
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        destinyPicker.delegate = self
        destinyPicker.dataSource = self
        
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
