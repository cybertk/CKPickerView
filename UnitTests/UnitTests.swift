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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
