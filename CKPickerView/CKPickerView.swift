//
//  CKPickerView.swift
//  CKPickerView
//
//  Copyright © 2015 cybertk. All rights reserved.
//

import UIKit

public class CKPickerView {
    
    // MARK: Internal Properties
    
    var someProperty: String
    
    // MARK: APIs
    
    public func hello() -> String {
        return someProperty
    }
    
    // MARK: Initilizers
    
    public init() {
        someProperty = "a string"
    }
}


