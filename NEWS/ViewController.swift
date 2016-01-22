//
//  ViewController.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 6..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    var dataManager:DataManager!
    
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
    
    // MARK: - UITableViewdelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataManager.titles.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:NewsCell = self.tableView.dequeueReusableCellWithIdentifier("news_cell")! as! NewsCell
        
        cell.title.text = self.dataManager.titles[indexPath.row]
        cell.title.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 22.0)
        
        cell.desc.text = self.dataManager.descs[indexPath.row]
        cell.desc.font = UIFont(name: "TimesNewRomanPSMT", size: 12.0)
        
        let imageName = indexPath.row%2
        cell.bgImage.image = UIImage(named: "\(imageName)")
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
 
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0;
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    // MARK: - override prepareForSegue
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

