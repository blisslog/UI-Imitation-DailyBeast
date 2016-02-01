//
//  NewsCell.swift
//  NEWS
//
//  Created by BlissLog on 2016. 1. 6..
//  Copyright © 2016년 BlissLog. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ArticleCell: MGSwipeTableCell, BGImageFlowProtocol {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var viewFrame: UIView!
    @IBOutlet weak var checkReaded: UIImageView!
    @IBOutlet weak var readingProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func flowCell(moveY value: CGFloat) {
        self.bgImage.transform = CGAffineTransformMakeTranslation(0.0, value)
    }

}
