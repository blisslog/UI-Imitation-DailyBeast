//
//  UIImage+grayscale.swift
//  NEWS
//
//  https://github.com/devxoul/Hippo-iOS/blob/master/Hippo/Extensions/UIImage%2BGrayScale.swift
//

import UIKit

extension UIImage {
    func grayscale() -> UIImage {
        let imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height);
        let colorSpace = CGColorSpaceCreateDeviceGray();
        
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: .allZeros);
        context?.draw(self.cgImage!, in: imageRect);
        
        let imageRef = context?.makeImage();
        let newImage = UIImage(cgImage: imageRef!)
        return newImage
    }
}
