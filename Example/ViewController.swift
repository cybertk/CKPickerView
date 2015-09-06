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
    
    @IBOutlet weak var picker: CKPickerView!
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.titles = ["Title 1", "Title 2"]
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(5000, inComponent: 0, animated: true)
        picker.selectRow(5001, inComponent: 1, animated: true)
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 15_000
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Every \(row % 16)"
    }
}

