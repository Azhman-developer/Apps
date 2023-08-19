//
//  VideoListView.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideoListView: UIView {
    
    var clipCollectionView: UICollectionView!
    
    var config: VideoListView.Config!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
}

// MARK: - Models
extension VideoListView {
    
    struct Config {
        var collectionViewDelegates: CollectionViewDelegates
    }
}

// MARK: - Setup Functions
extension VideoListView {
    
    private func createSubviews() {
        createClipCollectionView()
    }
    
    private func createClipCollectionView() {
        let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.frame.width, height: 700)

        clipCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clipCollectionView.collectionViewLayout = layout
        clipCollectionView.contentInset = sectionInset
        clipCollectionView.showsVerticalScrollIndicator = false
        clipCollectionView.backgroundColor = UIColor.blue
        clipCollectionView.register(VideoListCollectionViewCell.self, forCellWithReuseIdentifier: VideoListCollectionViewCell.identifier)

        clipCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(clipCollectionView)
        
        NSLayoutConstraint.activate([
            clipCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            clipCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            clipCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            clipCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setup(withConfig config: VideoListView.Config) {
        self.config = config
        setupCollectionViewDelegateDataSource()
    }
    
    private func setupCollectionViewDelegateDataSource() {
        clipCollectionView.delegate = config.collectionViewDelegates
        clipCollectionView.dataSource = config.collectionViewDelegates
        clipCollectionView.collectionViewLayout = config.collectionViewDelegates
        clipCollectionView.reloadData()
    }
}

