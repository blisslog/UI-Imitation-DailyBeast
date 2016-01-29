//
//  Article.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 28..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

class Article {
    
    var title:String?
    var desc:String?
    var content:String?
    var imgUrl:String?
    var readed:Bool! = false
    var readingRate:Float = 0.0
    
    func setArticle(title:String, desc:String, content:String) {
        self.title = title
        self.desc = desc
        self.content = content
    }
    
    func setArticle(title:String, desc:String, content:String, img_url:String) {
        self.title = title
        self.desc = desc
        self.content = content
        self.imgUrl = img_url
    }
    
}
