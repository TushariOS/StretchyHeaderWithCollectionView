//
//  Extension+View.swift
//  StretchyHeaderWithCollectionView
//
//  Created by Tushar on 04/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func fillSuperView() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, botton: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }

    func anchoreSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }

    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, botton: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize =  .zero) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }

        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }

        if let botton = botton {
            bottomAnchor.constraint(equalTo: botton, constant:  -padding.bottom).isActive = true
        }

        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
