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
        let windowRect = UIScreen.main.bounds
        return windowRect.size
    }
    
    // MARK : check exist image
    static func getFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    static func isExistImageFile(_ imageUrl:String) -> (is_exist:Bool, full_path:String) {
        let arr = imageUrl.components(separatedBy: "/")
        let fileName:NSString = arr[arr.count - 1] as NSString
        
        let filePath = Utility.getFilePath()
        let fileManager = FileManager.default
        let fullPath = filePath + (fileName as String)

        let isExist = fileManager.fileExists(atPath: fullPath)
        
        return (is_exist:isExist, full_path:fullPath)
        
    }
    
}
