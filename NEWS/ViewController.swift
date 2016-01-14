//
//  ViewController.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 6..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    var titles: [String] = ["Marco Rubio's 'Illegal'\nBromance\nOKOK 3 line"
        , "The Secret Gay World of ISIS"
        , "CIA Eyes Russian Hackers in\nGrid Attack"
        , "Photo of the Day"
        , "Marco Rubio's 'Illegal'\nBromance\nOKOK 3 line"
        , "The Secret Gay World of ISIS"
        , "CIA Eyes Russian Hackers in\nGrid Attack"
        , "Photo of the Day"
        , "Marco Rubio's 'Illegal'\nBromance\nOKOK 3 line"
        , "The Secret Gay World of ISIS"
        , "CIA Eyes Russian Hackers in\nGrid Attack"
        , "Photo of the Day"
        , "Marco Rubio's 'Illegal'\nBromance\nOKOK 3 line"
        , "The Secret Gay World of ISIS"
        , "CIA Eyes Russian Hackers in\nGrid Attack"
        , "Photo of the Day"]
    var descs: [String] = ["What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
        , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
        , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
        , "The best images from around the world"
        , "What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
        , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
        , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
        , "The best images from around the world"
        , "What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
        , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
        , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
        , "The best images from around the world"
        , "What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
        , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
        , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
        , "The best images from around the world"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewdelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:NewsCell = self.tableView.dequeueReusableCellWithIdentifier("news_cell")! as! NewsCell
        
        cell.title.text = self.titles[indexPath.row]
        cell.title.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 22.0)
        
        cell.desc.text = self.descs[indexPath.row]
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
}

