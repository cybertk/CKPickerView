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
        let expecedTitles = ["T1", "T2"]
        
        p.titles = expecedTitles
        expect(p.titles).to(equal(expecedTitles))
        expect(p.titleHeight).to(equal(kTitleHeight))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
