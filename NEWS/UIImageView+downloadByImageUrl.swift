//
//  UIImageView+downloadByImageUrl.swift
//  NEWS
//
//  http://stackoverflow.com/questions/24231680/loading-image-from-url
//  answered Leo Dabus
//

import UIKit

extension UIImageView {
    func downloadByImageUrl(_ urlStr:String, grayscale:Bool) {
        guard let url = URL(string: urlStr) else {return}
        
        let extInfo = Utility.isExistImageFile(urlStr)
        if extInfo.is_exist {
            var image = UIImage(contentsOfFile: extInfo.full_path)!
            if grayscale {image = image.grayscale()}
            DispatchQueue.main.async { () -> Void in
                self.image = image
            }
        } else {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    var image = UIImage(data: data)
                    else { return }
                if grayscale {image = image.grayscale()}
                try? data.write(to: URL(fileURLWithPath: extInfo.full_path), options: [.atomic])
                DispatchQueue.main.async { () -> Void in
                    self.image = image
                    UIView.animate(withDuration: 0.25, animations: { () -> Void in
                        self.alpha = 0
                        self.alpha = 1
                    })
                }
            }).resume()
        }

    }
}
