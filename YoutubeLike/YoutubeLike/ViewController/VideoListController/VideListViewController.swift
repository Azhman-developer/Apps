//
//  ViewController.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideListViewController: UIViewController {

    var contentView = VideoListView()
    var coordinator: Coordinator?
    
    override func loadView() {
        super.loadView()
        loadContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
} 

// MARK: - Setup Views Function
extension VideListViewController {
    
    func loadContentView() {
        self.view = contentView
    }
    
    func setupViews() {
        setupContentView()
    }
    
    func setupNavigationBar() {
        let horizontalConstraints: CGFloat = 16 * 2
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                               width: view.layer.frame.width - horizontalConstraints,
                                               height: view.layer.frame.height)
        )
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    
    func setupContentView() {
        let config = VideoListView.Config(collectionViewDelegates: VideoListCollectionViewDelegates())
        contentView.setup(withConfig: config)
    }
}
