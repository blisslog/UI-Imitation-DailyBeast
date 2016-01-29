//
//  UIImageView+downloadByImageUrl.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 29..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadByImageUrl(urlStr:String, grayscale:Bool) {
        guard let url = NSURL(string: urlStr) else {return}
        
        let extInfo = Utility.isExistImageFile(urlStr)
        if extInfo.is_exist {
            let image = UIImage(contentsOfFile: extInfo.full_path)!
            if grayscale {image.grayscale()}
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        } else {
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                guard
                    let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                    let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                    let data = data where error == nil,
                    let image = UIImage(data: data)
                    else { return }
                if grayscale {image.grayscale()}
                data.writeToFile(extInfo.full_path, atomically: true)
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self.image = image
                }
            }).resume()
        }

    }
}
