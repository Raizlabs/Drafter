//
//  ViewController.swift
//  TailoredSwiftAutoLayoutHelpers
//
//  Created by mattThousand on 07/31/2015.
//  Copyright (c) 2015 mattThousand. All rights reserved.
//

import UIKit
import TailoredSwiftAutoLayoutHelpers

class ViewController: UIViewController {

    let kSize: CGSize = CGSize(width: 40.0, height: 40.0)
    let kInsets: UIEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    let kSpace: CGFloat = 8.0
    let kOffset: CGFloat = 100.0

    // fill (pins)
    let fillView = UIView()

    // center
    let centerView = UIView()

    // attach and align
    let right = UIView()
    let left = UIView()
    let top = UIView()
    let bottom = UIView()

    // space and mass align
    let firstHorizontalSpaceView = UIView()
    let spacingHorizontalSubviews: [UIView]

    let firstVerticalSpaceView = UIView()
    let spacingVerticalSubviews: [UIView]



    required init?(coder aDecoder: NSCoder) {
        spacingHorizontalSubviews = [firstHorizontalSpaceView, UIView(), UIView(), UIView()]
        spacingVerticalSubviews = [firstVerticalSpaceView, UIView(), UIView(), UIView()]
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // fill
        view.addSubview(fillView)
        fillView.backgroundColor = UIColor.redColor()
        fillView.fillContainer(kInsets)

        // center
        fillView.addSubview(centerView)
        centerView.pinSize(toSize: kSize)
        centerView.backgroundColor = UIColor.greenColor()
        centerView.centerInContainer()

        // attach and align
        fillView.addSubview(bottom)
        bottom.pinSize(toSize: kSize)
        bottom.backgroundColor = UIColor.purpleColor()
        bottom.alignRight(toRightOfView: centerView)
        bottom.attachTop(toBottomOfView: centerView, withPadding: kSpace)

        fillView.addSubview(top)
        top.pinSize(toSize: kSize)
        top.backgroundColor = UIColor.purpleColor()
        top.alignLeft(toLeftOfView: centerView)
        top.attachBottom(toTopOfView: centerView, withPadding: kSpace)

        fillView.addSubview(left)
        left.pinSize(toSize: kSize)
        left.backgroundColor = UIColor.purpleColor()
        left.alignBottom(toBottomOfView: centerView)
        left.attachRight(toLeftOfView: centerView, withPadding: kSpace)

        fillView.addSubview(right)
        right.pinSize(toSize: kSize)
        right.backgroundColor = UIColor.purpleColor()
        right.alignTop(toTopOfView: centerView)
        right.attachLeft(toRightOfView: centerView, withPadding: kSpace)

        // Horizontal space and mass align
        for view in spacingHorizontalSubviews {
            view.pinSize(toSize: kSize)
            view.backgroundColor = UIColor.blueColor()
            fillView.addSubview(view)
            view.pinTopSpaceToSuperview(withPadding: kSpace)
        }
        firstHorizontalSpaceView.pinLeftSpaceToSuperview(withPadding: kSpace)
        fillView.space(subviews: spacingHorizontalSubviews,
            alongAxis: UILayoutConstraintAxis.Horizontal,
            withPadding: kSpace)

        // Vertical space and mass align
        for view in spacingVerticalSubviews {
            view.pinSize(toSize: kSize)
            view.backgroundColor = UIColor.blueColor()
            fillView.addSubview(view)
            view.pinRightSpaceToSuperview(withPadding: kSpace)
        }
        firstVerticalSpaceView.pinBottomSpaceToSuperview(withPadding: kSpace)
        fillView.space(subviews: spacingVerticalSubviews,
            alongAxis: UILayoutConstraintAxis.Vertical,
            withPadding: kSpace)
    }
}

