//
//  ViewController.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideListViewController: UIViewController {

    var contentView = VideoListView()
    
    override func loadView() {
        super.loadView()
        loadContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
} 

// MARK: - Setup Views Function
extension VideListViewController {
    
    func loadContentView() {
        self.view = contentView
    }
    
    func setupViews() {
        setupNavigationBar()
        setupContentView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Video List"
    }
    
    func setupContentView() {
        let config = VideoListView.Config(collectionViewDelegates: VideoListCollectionViewDelegates())
        contentView.setup(withConfig: config)
    }
}
