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
            var image = UIImage(contentsOfFile: extInfo.full_path)!
            if grayscale {image = image.grayscale()}
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        } else {
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                guard
                    let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                    let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                    let data = data where error == nil,
                    var image = UIImage(data: data)
                    else { return }
                if grayscale {image = image.grayscale()}
                data.writeToFile(extInfo.full_path, atomically: true)
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self.image = image
                    UIView.animateWithDuration(0.25, animations: { () -> Void in
                        self.alpha = 0
                        self.alpha = 1
                    })
                }
            }).resume()
        }

    }
}
