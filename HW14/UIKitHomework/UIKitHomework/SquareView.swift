//
//  SquareView.swift
//  UIKitHomework
//
//  Created by Алена on 22.07.2021.
//

import Foundation
import UIKit

class SquareView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        print(view)
        return view
    }
}
