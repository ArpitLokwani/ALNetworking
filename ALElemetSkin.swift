//
//  ALElemetSkin.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 25/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit
import Foundation

class ALElemetSkin: UIView {

    static func viewWithFrame(frame:CGRect) -> UIView {
        let view = UIView.init(frame: frame)
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    
    static func  imageViewWithFrame(frame:CGRect) -> UIImageView {
        let imageVw = UIImageView.init(frame: frame)
        imageVw.backgroundColor = UIColor.clearColor()
        return imageVw
    }
    
    static func labelViewWithFrame(frame:CGRect,withText text:NSString) -> UILabel {
        let label = UILabel.init(frame: frame)
        label.text = text as String
        label.font = UIFont.systemFontOfSize(20.0)
        return label
    }
    
    static func scrollViewWithFrame(frame:CGRect) -> UIScrollView {
        let scrollView = UIScrollView.init(frame: frame)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
        scrollView.clipsToBounds = false
        scrollView.pagingEnabled = true
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.lightGrayColor().CGColor
        return scrollView
    }
    
    static func textFieldWithRect(rect:CGRect,placeHolder:NSString) -> UITextField {
        let textField:UITextField = UITextField.init(frame: rect)
        let leftView=UIView(frame: CGRectMake(100, 200, 100, 100))
        leftView.backgroundColor=UIColor.greenColor()
        leftView.layer.cornerRadius=25
        leftView.layer.borderWidth=2
        textField.leftView = leftView;
        textField.placeholder = placeHolder as String
        return textField
    }
    
    static func button(frame:CGRect,title:NSString) -> UIButton {
        let button   = UIButton(type: UIButtonType.Custom) as UIButton
        button.setTitleColor(UIColor.whiteColor(), forState:UIControlState.Normal)
        button.frame = frame
        return button
    }
}
