//
//  PageView+UIKitRepresentable.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 10/1/19.

import SwiftUI

extension PageView: UIViewControllerRepresentable {
    public func makeCoordinator() -> PageView.Coordinator {
        if indicatorVisible {
            return Coordinator_indicator(pages: pages)
        } else {
            return Coordinator(pages: pages)
        }
    }
    
    public func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        context.coordinator.beforeTransitionHandler = beforeTransitionHandler
        context.coordinator.afterTransitionHandler = afterTransitionHandler
    }
    
    public func makeUIViewController(context: Context) -> UIPageViewController {
        let controller = UIPageViewController(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: toOptionsDictionary())
        controller.dataSource = context.coordinator
        controller.delegate = context.coordinator
        controller.setViewControllers([pages.first!], direction: .forward, animated: true)
        return controller
    }
    
    fileprivate func toOptionsDictionary() -> [UIPageViewController.OptionsKey : Any] {
        var dict: [UIPageViewController.OptionsKey : Any] = [:]
        if interPageSpacing != nil {
            dict[.interPageSpacing] = NSNumber(value: Float(interPageSpacing!))
        }
        if spineLocation != nil {
            dict[.spineLocation] = spineLocation!
        }
        return dict
    }
}
