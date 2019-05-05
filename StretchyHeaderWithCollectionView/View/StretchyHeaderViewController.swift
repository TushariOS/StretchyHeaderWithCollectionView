//
//  StretchyHeaderViewController.swift
//  StretchyHeaderWithCollectionView
//
//  Created by Tushar on 03/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//


import UIKit

class StretchyHeaderViewController: UICollectionViewController {

    fileprivate let reuseIdentifier = "CellId"
    fileprivate let headerIdentifer = "HeaderId"
    fileprivate let padding: CGFloat = 16.0
    var headerView: HeaderView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionViewLayout()
        setupCollectionViewCell()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }

    private func setupCollectionViewCell() {

        self.collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Register Header classes
        self.collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifer)
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red

        return cell
    }
}

extension StretchyHeaderViewController: UICollectionViewDelegateFlowLayout {

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print(contentOffsetY)
        if contentOffsetY > 0 {
            headerView?.animator.fractionComplete = 0
            return
        }

        headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.size.width - 2 * padding, height: 50)

    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifer, for: indexPath) as? HeaderView
        return headerView!
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width:  view.frame.size.width, height: 340)
    }
}
