//
//  ViewController.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 6..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIGestureRecognizerDelegate, MGSwipeTableCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    var dataManager:DataManager!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.interactivePopGestureRecognizer!.delegate = self
        dataManager = DataManager.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rightButtons() -> NSArray {
        let btns :NSMutableArray = NSMutableArray()

        // MGSwipeTableCell
        let btn1 = MGSwipeButton(title: "SKIP", backgroundColor: UIColor(red: 242.0/255.0, green: 5.0/255.0, blue: 5.0/255.0, alpha: 1.0), padding:5, callback: {
            (sender: MGSwipeTableCell!) -> Bool in
            
            return true
        })
        btn1.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 60.0)
        btn1.sizeToFit()
        
        btns.addObject(btn1)

        return btns
    }
    
    func leftButtons() -> NSArray {
        let btns :NSMutableArray = NSMutableArray()
        
        // MGSwipeTableCell
        let btn1 = MGSwipeButton(title: "FOLLOW\nAUTHOR", backgroundColor: UIColor(red: 191.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.0), padding:20, callback: {
            (sender: MGSwipeTableCell!) -> Bool in
            print("FOLLOW AUTHOR")
            return true
        })
        btn1.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 15.0)
        btn1.sizeToFit()
        
        let btn2 = MGSwipeButton(title: "SHARE\nSTORY", backgroundColor: UIColor(red: 140.0/255.0, green: 22.0/255.0, blue: 22.0/255.0, alpha: 1.0), padding:20, callback: {
            (sender: MGSwipeTableCell!) -> Bool in
            print("SHARE STORY")
            return true
        })
        btn2.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 15.0)
        btn2.sizeToFit()
        
        btns.addObject(btn1)
        btns.addObject(btn2)
        
        return btns
    }
    
    // MARK: - UITableViewdelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataManager.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ArticleCell = self.tableView.dequeueReusableCellWithIdentifier("article_cell")! as! ArticleCell
        
        let article = self.dataManager.items[indexPath.row] as Article
        
        cell.title.text = article.title
        cell.title.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 22.0)
        
        cell.desc.text = article.desc
        cell.desc.font = UIFont(name: "TimesNewRomanPSMT", size: 12.0)
        
        if article.readed! {
            cell.title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            cell.desc.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        } else {
            cell.title.textColor = UIColor.blackColor()
            cell.desc.textColor = UIColor.blackColor()
        }
        
        if article.readingRate >= 1.0 {
            cell.checkReaded.hidden = false
            cell.readingProgress.progress = 0.0
        } else {
            cell.checkReaded.hidden = true
            cell.readingProgress.progress = article.readingRate    
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)) { () -> Void in
            cell.bgImage.downloadByImageUrl(article.imgUrl!, grayscale: true)
        }

        cell.delegate = self
        
        return cell
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! ArticleCell
        let article = self.dataManager.items[indexPath.row] as Article
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)) { () -> Void in
            cell.bgImage.downloadByImageUrl(article.imgUrl!, grayscale: false)
        }
    }
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! ArticleCell
        let article = self.dataManager.items[indexPath.row] as Article
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)) { () -> Void in
            cell.bgImage.downloadByImageUrl(article.imgUrl!, grayscale: true)
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0;
    }
    
    /*
    // MARK : - Edit
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .Normal, title: "More") { action, index in
            print("more button tapped")
        }
        more.backgroundColor = UIColor.lightGrayColor()
        
        let favorite = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            print("favorite button tapped")
        }
        favorite.backgroundColor = UIColor.orangeColor()
        
        let share = UITableViewRowAction(style: .Normal, title: "Share") { action, index in
            print("share button tapped")
        }
        share.backgroundColor = UIColor.blueColor()
        
        return [share, favorite, more]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    // MARK : -
    */
    
    // MARK: - MGSwipeTableCellDelegate 
    // https://github.com/MortimerGoro/MGSwipeTableCell
    func swipeTableCell(cell: MGSwipeTableCell!, swipeButtonsForDirection direction: MGSwipeDirection, swipeSettings: MGSwipeSettings!, expansionSettings: MGSwipeExpansionSettings!) -> [AnyObject]! {
        swipeSettings.transition = MGSwipeTransition.Border
        expansionSettings.buttonIndex = 0
        
        if direction == MGSwipeDirection.LeftToRight {
            expansionSettings.fillOnTrigger = false
            expansionSettings.threshold = 1.2
            return self.leftButtons() as [AnyObject]
        }
        else {
            expansionSettings.fillOnTrigger = true
            expansionSettings.threshold = 2.0
            
            return self.rightButtons() as [AnyObject]
        }
    }
    
    func swipeTableCell(cell: MGSwipeTableCell!, didChangeSwipeState state: MGSwipeState, gestureIsActive: Bool) {
        let str:NSString!
        
        switch state {
        case MGSwipeState.None: str = "None"
        case MGSwipeState.SwipingLeftToRight: str = "SwipingLeftToRight"
        case MGSwipeState.SwipingRightToLeft:
            str = "SwipingRightToLeft"
            cell.swipeBackgroundColor = UIColor(red: 242.0/255.0, green: 5.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        case MGSwipeState.ExpandingLeftToRight: str = "ExpandingLeftToRight"
        case MGSwipeState.ExpandingRightToLeft: str = "ExpandingRightToLeft"
        }
        NSLog("Swipe state: \(str) ::: Gesture: %@", gestureIsActive ? "Active" : "Ended");
    }
    
    func swipeTableCellWillEndSwiping(cell: MGSwipeTableCell!) {
        cell.swipeBackgroundColor = UIColor.clearColor()
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    // MARK: - UINavigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("\(segue.identifier)")
        if segue.identifier == "goArticle" {
            
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return;
            }
            
            let article = segue.destinationViewController as! ArticleViewController;
            article.index = indexPath.row
        }
    }
    
}

