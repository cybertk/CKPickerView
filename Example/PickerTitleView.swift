//
//  PickerTitleView.swift
//  CKPickerView
//
//  Created by Quanlong He on 9/10/15.
//  Copyright © 2015 cybertk. All rights reserved.
//

import UIKit


class PickerTitleView: UIView {
    private var label1: UILabel!
    private var label2: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: CGRect())
        
        backgroundColor = UIColor.grayColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label1 = label1 ?? createLabel("T1")
        label2 = label2 ?? createLabel("T2")
        
        
        label1.frame.size.width = 110
        label1.frame.size.height = 30
        label1.frame.origin.x = frame.width / 2 - 110
        label1.frame.origin.y = 0
        
        label2.frame.size.width = 110
        label2.frame.size.height = 30
        label2.frame.origin.x = frame.width / 2
        label2.frame.origin.y = 0
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.text = text
        
        addSubview(label)
        return label
    }
}