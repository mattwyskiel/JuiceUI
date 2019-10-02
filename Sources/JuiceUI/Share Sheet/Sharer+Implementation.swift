//
//  Sharer+Implementation.swift
//  JuiceUI
//
//  Created by Matthew Wyskiel on 9/29/19.
//  Copyright © 2019 Matthew Wyskiel. All rights reserved.
//

import SwiftUI

extension SharerWithAction {
    var uiActivity: UIActivity {
        SharerActivity(type: type, title: title, image: image, canPerform: canPerform, perform: perform, viewController: nil)
    }
}

extension SharerWithView {
    var uiActivity: UIActivity {
        SharerActivity(type: type, title: title, image: image, canPerform: canPerform, perform: nil) { items in
            UIHostingController(rootView: self.view(for: items))
        }
    }
}

class SharerActivity: UIActivity {
    init(type: UIActivity.ActivityType, title: String, image: UIImage, canPerform: @escaping ([Any]) -> Bool, perform: (([Any]) -> ())?, viewController: (([Any]) -> (UIViewController))?) {
        self._type = type
        self._title = title
        self._image = image
        self._canPerform = canPerform
        self._perform = perform
        self._viewController = viewController
    }
    
    private var _type: UIActivity.ActivityType
    override var activityType: UIActivity.ActivityType? {
        _type
    }
    
    private var _title: String
    override var activityTitle: String? {
        _title
    }
    
    private var _image: UIImage
    override var activityImage: UIImage? {
        _image
    }
    
    private var _canPerform: ([Any]) -> Bool
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        _canPerform(activityItems)
    }
    
    private var items: [Any] = []
    override func prepare(withActivityItems activityItems: [Any]) {
        items = activityItems
    }
    
    private var _perform: (([Any]) -> ())?
    override func perform() {
        _perform?(items)
    }
    
    private var _viewController: (([Any]) -> (UIViewController))?
    override var activityViewController: UIViewController? {
        _viewController?(items)
    }
}

