//
//  ArticleViewController.swift
//  NEWS
//
//  Created by BlissLog on 2016. 1. 15..
//  Copyright © 2016년 BlissLog. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var label_article: UILabel!
    @IBOutlet weak var label_content: UILabel!
    @IBOutlet weak var img_bg: UIImageView!
    @IBOutlet weak var progress_readed: UIProgressView!
    var index: Int = 0
    var dataManager: DataManager!
    var reqNext:Bool = false
    var dragging:Bool = false
    weak var article:Article!
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dataManager = DataManager.sharedInstance
        
        article = dataManager.items[index] as Article
        
        
        // Setting Data
        label_article.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 22.0)
        label_content.font = UIFont(name: "TimesNewRomanPSMT", size: 14.0)
        
        label_article.text = article.title
        label_content.text = article.content
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async { () -> Void in
            self.img_bg.downloadByImageUrl(self.article.imgUrl!, grayscale: false)
        }
        
        progress_readed.progress = article.readingRate
        
        // mark Readed
        article.readed = true
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
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // move next content
        let contentSize = scrollView.contentSize.height
        let offset_scrollBottom = scrollView.contentOffset.y + scrollView.bounds.height
        let rtnValue = contentSize - offset_scrollBottom
        
        if reqNext {
            return
        }
        
        if rtnValue < -50 {
            if dragging && self.progress_readed.progress >= 1.0 && dataManager.items.count > index + 1 {
                reqNext = true
                
                let transition = CATransition()
                transition.duration = 0.4
                transition.type = kCATransitionMoveIn
                transition.subtype = kCATransitionFromTop
                
                self.navigationController!.view.layer .add(transition, forKey: kCATransition)
                
                let vc:ArticleViewController = self.storyboard!.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
            
                vc.index = index + 1
                self.navigationController!.pushViewController(vc, animated: false)
                
                article.readingRate = 1.0
            }
        }
        
        // mark progress readed
        let init_size = scrollView.bounds.height
        let progress_value = (scrollView.contentOffset.y) / (contentSize - init_size)
        
        if self.progress_readed.progress < Float(progress_value) {
            self.progress_readed.progress = Float(progress_value)
            article.readingRate = Float(progress_value)
        } else if self.progress_readed.progress >= 1.0 {
            article.readingRate = 1.0
        }
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        dragging = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        dragging = false
    }
    
}






