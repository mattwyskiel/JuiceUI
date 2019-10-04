//
//  PageView+Coordinator.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.

import SwiftUI

extension PageView {
    public class Coordinator: NSObject {
        var index: Int = 0
        var pages: [UIViewController]
        init(pages: [UIViewController]) {
            self.pages = pages
        }
        
        var beforeTransitionHandler: (([Page]) -> ())? = nil
        var afterTransitionHandler: ((Bool, [Page], Bool) -> ())? = nil
    }
}

extension PageView.Coordinator: UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController != pages.first {
            let idx = pages.firstIndex(of: viewController)
            return pages[idx! - 1]
        }
        return nil
    }
        
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController != pages.last {
            let idx = pages.firstIndex(of: viewController)
            return pages[idx! + 1]
        }
        return nil
    }
}

extension PageView.Coordinator: UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let views = pendingViewControllers.map { ($0 as! UIHostingController<Page>).rootView }
        beforeTransitionHandler?(views)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let views = previousViewControllers.map { ($0 as! UIHostingController<Page>).rootView }
        afterTransitionHandler?(finished, views, completed)
    }
    
    /* TODO: dynamically provide spine location */
}

extension PageView {
    public class Coordinator_indicator: Coordinator {
        public func presentationCount(for pageViewController: UIPageViewController) -> Int {
            pages.count
        }
        
        public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            if let viewController = pageViewController.viewControllers?.first {
                return pages.firstIndex(of: viewController)!
            }
            return 0;
        }
    }
}
