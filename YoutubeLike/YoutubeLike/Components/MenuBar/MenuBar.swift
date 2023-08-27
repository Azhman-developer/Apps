//
//  MenuBar.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/23/23.
//

import UIKit

final class MenuBar: UIView {
    
    private var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
}

extension MenuBar {
    
    private func createSubViews() {
        createCollectionView()
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Colors.red

        addSubview(collectionView)
        addConstraintsWith(format: "H:|[v0]|", views: collectionView)
        addConstraintsWith(format: "V:|[v0]|", views: collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Abud")
    }
    
    
    
    func setup(withCVDelegateAndDataSource delegateDatasource: CollectionViewDelegates) {
        collectionView.dataSource = delegateDatasource
        collectionView.delegate = delegateDatasource
        collectionView.collectionViewLayout = delegateDatasource
        collectionView.reloadData()
    }
}


