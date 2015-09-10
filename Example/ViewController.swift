//
//  ViewController.swift
//  Example
//
//  Copyright © 2015 cybertk. All rights reserved.
//

import UIKit

import CKPickerView


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var picker1: CKPickerView!
    @IBOutlet weak var picker2: CKPickerView!
    @IBOutlet weak var picker3: CKPickerView!
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure picker1
        picker1.titles = ["Title"]
        picker1.delegate = self
        picker1.dataSource = self
        
        // configure picker2
        picker2.attributedTitles = [
            NSAttributedString(string: "Title 1", attributes: [
                NSForegroundColorAttributeName: UIColor.whiteColor()
            ]),
            NSAttributedString(string: "Title 2", attributes: [
                NSForegroundColorAttributeName: UIColor.whiteColor()
            ]),
        ]
        picker2.delegate = self
        picker2.dataSource = self
        picker2.selectRow(5000, inComponent: 0, animated: true)
        picker2.selectRow(5001, inComponent: 1, animated: true)
        picker2.backgroundColor = UIColor.blackColor()
        picker2.selectionIndicatorColor = UIColor.whiteColor()
        
        // configure picker3
        picker3.titleView = PickerTitleView()
        picker3.delegate = self
        picker3.dataSource = self
        picker3.selectRow(5000, inComponent: 0, animated: true)
        picker3.selectRow(5001, inComponent: 1, animated: true)
        picker3.selectRow(5002, inComponent: 2, animated: true)
        picker3.selectionBackgroundColor = UIColor.grayColor()
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == picker1 {
            return 1
        }
        
        if pickerView == picker2 {
            return 2
        }
        
        if pickerView == picker3 {
            return 3
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == picker1 {
            return 30
        }
        
        if pickerView == picker2 {
            return 15_000
        }
        
        if pickerView == picker3 {
            return 15_000
        }
        
        return 0
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView == picker1 {
            return NSAttributedString(string: "r\(row)")
        }
        
        if pickerView == picker2 {
            let s = NSAttributedString(string: "A\(row % 16)", attributes: [
                NSForegroundColorAttributeName: UIColor.whiteColor()
            ])

            return s
        }
        
        if pickerView == picker3 {
            let s = NSAttributedString(string: "A\(row % 30)", attributes: [
                NSForegroundColorAttributeName: UIColor.blueColor()
                ])
            
            return s
        }
        
        return nil
    }
}

