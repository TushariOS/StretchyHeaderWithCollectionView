//
//  HeaderView.swift
//  StretchyHeaderWithCollectionView
//
//  Created by Tushar on 03/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {

    let imageView: UIImageView =  {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Image"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    var animator: UIViewPropertyAnimator!

    override init(frame: CGRect) {
        super.init(frame: frame)

        //Custome code for layout.
        backgroundColor = .green
        addSubview(imageView)
        imageView.fillSuperView()

        // Visula blur effect
        setupAnimationEffect()
    }

    fileprivate func setupAnimationEffect() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let bluerEffect = UIBlurEffect.init(style: .regular)
            let visualEffectView  = UIVisualEffectView(effect: bluerEffect)
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperView()
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
