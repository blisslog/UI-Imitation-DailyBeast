//
//  Utility.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 19..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

class Utility: NSObject {
    internal func getScreenSize() -> CGSize {
        let windowRect = UIScreen.mainScreen().bounds
        return windowRect.size
    }
}
