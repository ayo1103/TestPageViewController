//
//  TeacherPageViewController.swift
//  TestPageViewController
//
//  Created by Bryan Lin on 6/21/15.
//  Copyright (c) 2015 ayo1103. All rights reserved.
//

import UIKit

class TeacherPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageTitles: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageTitles = NSArray(objects: "Page 1", "Page 2", "Page 3")
        self.dataSource = self

        var startVC = self.contentViewControllerAtIndex(0) as ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        self.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func contentViewControllerAtIndex(index: Int) -> ContentViewController {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return ContentViewController()
        }

        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        vc.pageIndex = index
        return vc
    }


    // MARK: - Page View Controller Data Source 
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        var vc: ContentViewController = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound) {
            return nil
        }

        index--
        return self.contentViewControllerAtIndex(index)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {

        var vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == NSNotFound) {
            return nil
        }

        index++

        if (index == self.pageTitles.count) {
            return nil
        }

        return self.contentViewControllerAtIndex(index)
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
