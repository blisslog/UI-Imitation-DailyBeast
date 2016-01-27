//
//  MGSwipeTableCell+extensionWithFont.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 27..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit
import MGSwipeTableCell

extension MGSwipeButton {
    func buttonWithTitle(title title:String, font:UIFont, icon:UIImage, backgroundColor:UIColor, insets:UIEdgeInsets, callback:MGSwipeButtonCallback) -> MGSwipeButton {
        let btn = MGSwipeButton(type: UIButtonType.Custom)
        btn.backgroundColor = backgroundColor
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        btn.titleLabel?.textAlignment = NSTextAlignment.Center
        btn.titleLabel?.font = font
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.setImage(icon, forState: UIControlState.Normal)
        btn.callback = callback
        btn.setEdgeInsets(insets)

        return btn
    }
}
