//
//  UnitTests.swift
//  UnitTests
//
//  Created by generator-swift-framework on 8/26/15.
//  Copyright © 2015 cybertk. All rights reserved.
//

import XCTest
import Nimble

@testable import CKPickerView

class UnitTests: XCTestCase {
    
    class TestDataSource: NSObject, UIPickerViewDataSource {
        
        func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 100
        }
        
        func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
            return 1
        }
    }
    
    var window = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    var dataSource = TestDataSource()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        // When init a new CKPickerView
        let p = CKPickerView()
        
        expect(p.titles).to(beEmpty())
        expect(p.titleHeight).to(equal(kTitleHeight))
    }
    
    func testTitles() {
        // When update titles
        let p = CKPickerView()
        let expectedTitles = ["T1", "T2"]
        let expectedAttributedTitles = [NSAttributedString(string: "T1"), NSAttributedString(string: "T2")]
        
        p.titles = expectedTitles
        expect(p.titles).to(equal(expectedTitles))
        expect(p.attributedTitles).to(equal(expectedAttributedTitles))
        expect(p.titleHeight).to(equal(kTitleHeight))
    }
    
    func testAttributedTitles() {
        // When update attributedTitles
        let p = CKPickerView()
        let expectedTitles = ["T1", "T2"]
        let expectedAttributedTitles =  [
            NSAttributedString(string: "T1", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()]),
            NSAttributedString(string: "T2", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()]),
        ]
        
        p.attributedTitles = expectedAttributedTitles
        expect(p.titles).to(equal(expectedTitles))
        expect(p.attributedTitles).to(equal(expectedAttributedTitles))
        expect(p.titleHeight).to(equal(kTitleHeight))
    }
    
    func testSelectionIndicatorColor() {
        var p: CKPickerView!
        
        // Given set selectionBackgroundColor
        p = CKPickerView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        p.selectionBackgroundColor = UIColor.grayColor()
        p.dataSource = dataSource
        //        p.frame = CGRect(x: 0, y: 0, width: 600, height: 600)
        
        // When layout
        
//        UIApplication.sharedApplication().windows.first?.addSubview(p)
        window.addSubview(p)
        p.layoutSubviews()
        
        // It should detected selection indicators
        expect(p.selectionIndicators.count).to(equal(2))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
