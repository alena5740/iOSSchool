//
//  DonutView.swift
//  UIKitHomework
//
//  Created by Алена on 22.07.2021.
//

import Foundation
import UIKit

class DonutView: UIView {

    var pathWithRadius = UIBezierPath()

    override init(frame: CGRect) {
        super.init(frame: frame)
        pathWithRadius = UIBezierPath(roundedRect: .init(x: 75, y: 75, width: 150, height: 150),
                                          byRoundingCorners: [.allCorners],
                                          cornerRadii: .init(width: 75, height: 75))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        makeHole()
    }


    private func makeHole() {
        let path = UIBezierPath(rect: bounds)
        path.append(pathWithRadius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        layer.mask = mask
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if pathWithRadius.contains(point) {
            return nil
        }
        if view === self {
            print(self)
            return self
        }
        print(view)
        return view
    }
}
