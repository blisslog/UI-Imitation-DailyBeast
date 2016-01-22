//
//  ArticleViewController.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 15..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var label_article: UILabel!
    @IBOutlet weak var label_content: UILabel!
    @IBOutlet weak var img_bg: UIImageView!
    var index: Int = 0
    var dataManager: DataManager!

    
    var reqNext:Bool = false
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dataManager = DataManager.sharedInstance
        
        self.label_article.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 22.0)
        self.label_content.font = UIFont(name: "TimesNewRomanPSMT", size: 14.0)
        
        self.label_article.text = self.dataManager.titles[self.index]
        self.label_content.text = self.dataManager.contents[self.index%2]
        self.img_bg.image = UIImage(named: "\(self.index%2)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pressedBtn() -> Void {
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if reqNext {
            return
        }
        
        let contentSize = scrollView.contentSize.height
        let offset_scrollBottom = scrollView.contentOffset.y + scrollView.bounds.height
        let rtnValue = contentSize - offset_scrollBottom
        
        if rtnValue < -50 {
            reqNext = true
            
            if self.dataManager.titles.count > index + 1 {
                let transition = CATransition()
                transition.duration = 0.4
                transition.type = kCATransitionMoveIn
                transition.subtype = kCATransitionFromTop
                
                self.navigationController!.view.layer .addAnimation(transition, forKey: kCATransition)
                
                let vc:ArticleViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ArticleViewController") as! ArticleViewController
            
                vc.index = index + 1
                self.navigationController!.pushViewController(vc, animated: false)
            }
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
}






