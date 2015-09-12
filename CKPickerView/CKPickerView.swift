//
//  CKPickerView.swift
//  CKPickerView
//
//  Copyright © 2015 cybertk. All rights reserved.
//

import UIKit


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
    
    // attributed titles is favored against titles
    public var attributedTitles = [NSAttributedString]()
    
    // titleView is favored against attributed titles and titles
    public var titleView: UIView?
    
    public var selectionIndicatorColor = UIColor.blackColor() {
        didSet {
            updateIndicatorsColor()
        }
    }
    
    public var selectionBackgroundColor: UIColor?
    
    // MARK: Intializers
    
    // MARK: UIView
    
    public override func layoutSubviews() {
        defer {
            layoutSelectionBackgroundViewIfNeeded()
        }
        
        if attributedTitles.isEmpty && titleView == nil {
            return super.layoutSubviews()
        }
        
        layoutTitleLabelsIfNeeded()
        
        // Pretend that our height without title
        frame.size.height -= titleHeight
        defer {
            frame.size.height += titleHeight
        }

        // UIPickerView behaviour observes:
        // 1. super.layoutSubviews() will never touch subviews' frame.origin.y
        super.layoutSubviews()

        // Find bodyView which is the most height view and update subviews' y if have not
        let bodyView = subviews.reduce(subviews[0]) { $0.frame.height > $1.frame.height ? $0 : $1 }
        guard bodyView.frame.origin.y != titleHeight else {
            return
        }
        
        // Move down all subviews except titles
        subviews
            .filter  { !$0.isKindOfClass(UILabel) }
            .filter  { $0 != titleView }
            .forEach { $0.frame.origin.y += titleHeight }
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
    
    var titleLabels = [UILabel]()

    var selectionIndicators = [UIView]()

    var selectionBackgroundView: UIView?
    
    private func updateIndicatorsColor() {        
        for view in selectionIndicators {
            view.backgroundColor = selectionIndicatorColor
        }
    }
    
    private func layoutTitleLabelsIfNeeded() {
        
        // Prefer titleView
        if let titleView = titleView where !subviews.contains(titleView) {
            addSubview(titleView)
            titleView.frame = CGRect(x: 0, y: 0, width: frame.width, height: titleHeight)
            titleView.autoresizingMask = .FlexibleWidth
            return
        }
        
        // Do not need layout if no titles are set
        guard !attributedTitles.isEmpty else {
            return
        }
        
        // Initialize titleLabel if does not
        if titleLabels.isEmpty {
            for title in attributedTitles {
                let label = UILabel()
                label.attributedText = title
                label.textAlignment = .Center
                
                titleLabels.append(label)
                addSubview(label)
            }
        }
    
        // Layout
        for (i, label) in titleLabels.enumerate() {
            let width: CGFloat = frame.width / CGFloat(titleLabels.count)
            label.frame.origin.x = 0 + width * CGFloat(i)
            label.frame.origin.y = 0
            label.frame.size.width = width
            label.frame.size.height = titleHeight
        }
    }
    
    private func layoutSelectionBackgroundViewIfNeeded() {
        
        guard let color = selectionBackgroundColor else {
            return
        }
        
        if selectionBackgroundView == nil {
            selectionBackgroundView = UIView()
            // Add selectionBackgroundView as background
            insertSubview(selectionBackgroundView!, atIndex: 0)
        }
        
        var frame = CGRect()
        frame.origin.x = 0
        frame.origin.y = selectionIndicators[0].frame.origin.y
        frame.size.width = selectionIndicators[0].frame.width
        frame.size.height = selectionIndicators[1].frame.origin.y - selectionIndicators[0].frame.origin.y

        selectionBackgroundView!.frame = frame
        selectionBackgroundView!.backgroundColor = color
    }
}
