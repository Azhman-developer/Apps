//
//  VideoListView.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideoListView: UIView {
    
    var clipCollectionView: UICollectionView!
    var menuBar: MenuBar!
    
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
        var menuBarConfig: MenuBarCollectionViewDelegate
    }
}

// MARK: - Setup Functions
extension VideoListView {
    
    private func createSubviews() {
        createMenuBar()
        createClipCollectionView()
    }
    
    private func createMenuBar() {
        menuBar =  MenuBar(frame: .zero)
        
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(menuBar)
        
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            menuBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func createClipCollectionView() {
        let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = VideoListCollectionViewCell.size
        
        clipCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        clipCollectionView.collectionViewLayout = layout
        clipCollectionView.contentInset = sectionInset
        clipCollectionView.showsVerticalScrollIndicator = false
        clipCollectionView.backgroundColor = UIColor.white
        
        clipCollectionView.register(VideoListCollectionViewCell.self, forCellWithReuseIdentifier: VideoListCollectionViewCell.identifier)
        
        clipCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(clipCollectionView)
        
        NSLayoutConstraint.activate([
            clipCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 0),
            clipCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            clipCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            clipCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setup(withConfig config: VideoListView.Config) {
        self.config = config
        setupCollectionViewDelegateDataSource()
        setupMenubar()
    }
    
    private func setupCollectionViewDelegateDataSource() {
        clipCollectionView.delegate = config.collectionViewDelegates
        clipCollectionView.dataSource = config.collectionViewDelegates
        clipCollectionView.collectionViewLayout = config.collectionViewDelegates
        self.clipCollectionView.reloadData()
    }
    
    private func setupMenubar() {
        let menuBarConfig = config.menuBarConfig
        menuBarConfig.size = CGSize(width: self.layer.bounds.width / 5, height: self.layer.bounds.height)
        menuBar.setup(withCVDelegateAndDataSource: menuBarConfig)
    }
}

