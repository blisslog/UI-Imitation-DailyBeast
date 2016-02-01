//
//  Utility.swift
//  NEWS
//
//  Created by BlissLog on 2016. 1. 19..
//  Copyright © 2016년 BlissLog. All rights reserved.
//

import UIKit

class Utility {
    
    // MARK : Screen Size
    static func getScreenSize() -> CGSize {
        let windowRect = UIScreen.mainScreen().bounds
        return windowRect.size
    }
    
    // MARK : check exist image
    static func getFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    static func isExistImageFile(imageUrl:String) -> (is_exist:Bool, full_path:String) {
        let arr = imageUrl.componentsSeparatedByString("/")
        let fileName:NSString = arr[arr.count - 1]
        
        let filePath = Utility.getFilePath()
        let fileManager = NSFileManager.defaultManager()
        let fullPath = filePath.stringByAppendingString(fileName as String)

        let isExist = fileManager.fileExistsAtPath(fullPath)
        
        return (is_exist:isExist, full_path:fullPath)
        
    }
    
}
