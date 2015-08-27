//
//  SpacingLayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/23/15.
//
//

import UIKit

public extension UIView {
    func space(subviews subviews: [UIView],
        alongAxis axis: UILayoutConstraintAxis,
        withPadding padding: CGFloat = 0.0,
        positiveDirection positive: Bool = true,
        isActive active: Bool = true,
        priority: UILayoutPriority = UILayoutPriorityRequired,
        relation: NSLayoutRelation = .Equal) -> [NSLayoutConstraint] {
            var constraints: [NSLayoutConstraint] = []
            for var i = 1; i <= subviews.count - 1; i++ {
                let view = subviews[i-1]
                let view2 = subviews[i]
                var constraint: NSLayoutConstraint
                switch (axis, positive) {
                case (.Horizontal, true):
                    constraint = view.attachRight(toLeftOfView: view2,
                        withPadding: padding,
                        isActive: false,
                        priority: priority,
                        relation: relation)
                case (.Horizontal, false):
                    constraint = view.attachLeft(toRightOfView: view2,
                        withPadding: padding,
                        isActive: false,
                        priority: priority,
                        relation: relation)
                case (.Vertical, true):
                    constraint = view.attachBottom(toTopOfView: view2,
                        withPadding: padding,
                        isActive: false,
                        priority: priority,
                        relation: relation)
                case (.Vertical, false):
                    constraint = view.attachTop(toBottomOfView: view2,
                        withPadding: padding,
                        isActive: false,
                        priority: priority,
                        relation: relation)
                }
                constraints.append(constraint)
            }
            if active {
                NSLayoutConstraint.activateConstraints(constraints)
            }

            return constraints
    }
}
