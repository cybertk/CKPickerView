//
//  CKPickerView.swift
//  CKPickerView
//
//  Copyright © 2015 cybertk. All rights reserved.
//

import UIKit


let kTitleTag = 0x90df00d
let kTitleHeight: CGFloat = 34.5

public class CKPickerView: UIPickerView {
    
    // MARK: - API
    
    // MARK: Properties
    
    public var titleHeight: CGFloat = kTitleHeight

    public var titles: [String] {
        get {
            var strings = [String]()
            
            for title in attributedTitles {
                strings.append(title.string)
            }
            
            return strings
        }
        
        set(value) {
            attributedTitles.removeAll()
            
            for string in value {
                attributedTitles.append(NSAttributedString(string: string))
            }
        }
    }
    
    public var attributedTitles = [NSAttributedString]()
    
    public var selectionIndicatorColor = UIColor.blackColor() {
        didSet {
            updateIndicatorsColor()
        }
    }
    
    // MARK: Intializers
    
    // MARK: UIView
    
    public override func layoutSubviews() {
        
        if attributedTitles.isEmpty {
            return super.layoutSubviews()
        }
        
        if !labelsConfigured {
            configureLabels()
        }
        
        // Pretend that our height without title
        frame.size.height -= titleHeight
        
        super.layoutSubviews()
        
        // Recover pretending
        for view in subviews {
            if view.tag >= kTitleTag && view.tag < kTitleTag + titles.count {
                // Do nothing for title labels
                continue
            }
            
            // Move picker views down
            view.frame.origin.y += titleHeight
        }
        frame.size.height += titleHeight
    }
    
    public override func intrinsicContentSize() -> CGSize {
        // Update prefer size
        var size = super.intrinsicContentSize()
        size.height += titleHeight
        return size
    }
    
    // Triggerd by layoutSubviews
    public override func didAddSubview(subview: UIView) {
        super.didAddSubview(subview)
        
        // Matching Selection Indicator
        if subview.frame.height == 0.5 && !selectionIndicators.contains(subview) {
            selectionIndicators.append(subview)
            
            subview.backgroundColor = selectionIndicatorColor
        }
    }
    
    // MARK: - Private Implementations
    
    private var labelsConfigured = false
    
    private var selectionIndicators = [UIView]()
    
    private func configureLabels() {
        var constraints = [NSLayoutConstraint]()
        var constraint = ""
        var views = [String: UIView]()
        
        for (i, title) in attributedTitles.enumerate() {
            
            // Bootstrap UILabel
            let label = UILabel()
            label.attributedText = title
            label.tag = kTitleTag + i
            label.textAlignment = NSTextAlignment.Center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(label)
            
            views["label\(i)"] = label
            
            if i == 0 {
                constraint += "H:|-0-[label0]"
            } else {
                constraint += "-[label\(i)(==label0)]"
            }
            
            if i == titles.count - 1 {
                constraint += "-0-|"
            }
            
            constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[label\(i)(\(titleHeight))]", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: views)
        }
        
        // Horizontal constraint
        constraints += NSLayoutConstraint.constraintsWithVisualFormat(constraint, options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: views)
        
        addConstraints(constraints)
        
        labelsConfigured = true
    }
    
    private func updateIndicatorsColor() {
        for view in selectionIndicators {
            view.backgroundColor = selectionIndicatorColor
        }
    }
}



