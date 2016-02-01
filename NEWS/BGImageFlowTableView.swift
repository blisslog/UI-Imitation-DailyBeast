//
//  BGImageFlowTableView.swift
//  NEWS
//
//  Created by BlissLog on 2016. 1. 14..
//  Copyright © 2016년 BlissLog. All rights reserved.
//

import UIKit

protocol BGImageFlowProtocol {
    func flowCell(moveY value:CGFloat)
}

class BGImageFlowTableView: UITableView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.flow()
    }
    
    private func flow() -> Void {
        for indexPath in self.indexPathsForVisibleRows! as [NSIndexPath] {
            if let cell = self.cellForRowAtIndexPath(indexPath) as? BGImageFlowProtocol {
                cell.flowCell(moveY: self.computeDistanceFromCenter(indexPath))
            }
        }
    }
    
    private func computeDistanceFromCenter(indexPath:NSIndexPath) -> CGFloat {
        let cellRect = self.rectForRowAtIndexPath(indexPath);
        let cellCenter = cellRect.origin.y + cellRect.size.height/2;
        let contentCenter = self.contentOffset.y + self.bounds.size.height/2;
        
        return (contentCenter - cellCenter) / 15
    }
    
}
