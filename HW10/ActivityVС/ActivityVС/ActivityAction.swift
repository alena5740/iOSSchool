//
//  ActivityAction.swift
//
//  Created by Алена on 17.07.2021.
//

import Foundation
import UIKit

final class ActivityAction: UIActivity {
    
    var title: String
    var image: UIImage?
    var items: [Any] = [Any]()
    var action: ([Any]) -> Void
    
    init(title: String, image: UIImage?, action: @escaping ([Any]) -> Void) {
        self.title = title
        self.image = image
        self.action = action
        super.init()
    }
    
    override var activityTitle: String? {
        return title
    }
    
    override var activityImage: UIImage? {
        return image
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("activityType")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.items = activityItems
    }
    
    override func perform() {
        action(items)
        activityDidFinish(true)
    }
}
