//
//  StretchyHeaderFlowLayout.swift
//  StretchyHeaderWithCollectionView
//
//  Created by Tushar on 03/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit

class StretchyHeaderFlowLayout: UICollectionViewFlowLayout {

    // To modify the attribute of our header view component
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttribute = super.layoutAttributesForElements(in: rect)
        layoutAttribute?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                
                //header
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y
                if contentOffsetY > 0 {
                    return
                }

                let width = collectionView.frame.size.width
                let height = attribute.frame.size.height - contentOffsetY
                attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttribute
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
