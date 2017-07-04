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
    
    fileprivate func flow() -> Void {
        for indexPath in self.indexPathsForVisibleRows! as [IndexPath] {
            if let cell = self.cellForRow(at: indexPath) as? BGImageFlowProtocol {
                cell.flowCell(moveY: self.computeDistanceFromCenter(indexPath))
            }
        }
    }
    
    fileprivate func computeDistanceFromCenter(_ indexPath:IndexPath) -> CGFloat {
        let cellRect = self.rectForRow(at: indexPath);
        let cellCenter = cellRect.origin.y + cellRect.size.height/2;
        let contentCenter = self.contentOffset.y + self.bounds.size.height/2;
        
        return (contentCenter - cellCenter) / 15
    }
    
}
