//
//  VideoListCollectionViewCell.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideoListCollectionViewCell: UICollectionViewCell {
 
    static var size: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
    
    private var thumbnailImageView: UIImageView!
    private var separatorView: UIView!
    private var userProfileImageView: UIImageView!
    private var titleLabel: UILabel!
    private var subtitleUITextView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createViews()
    }
}

extension VideoListCollectionViewCell {
    
    private func createViews() {
        createThumbnailImageView()
        createSeparatorView()
        createUserProfileImageView()
        createTitleLabel()
        createSubTitleTextView()
        addConstraintForViews()
    }
    
    private func createThumbnailImageView() {
        thumbnailImageView = UIImageView()
        thumbnailImageView.backgroundColor = .blue
        addSubview(thumbnailImageView)
    }
    
    private func createSeparatorView() {
        separatorView = UIView()
        separatorView.backgroundColor = .blue
        addSubview(separatorView)
    }
    
    private func createUserProfileImageView() {
        userProfileImageView = UIImageView()
        userProfileImageView.backgroundColor = .green
        addSubview(userProfileImageView)
    }
    
    private func createTitleLabel() {
        titleLabel = UILabel()
        titleLabel.backgroundColor = .purple
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
    }
    
    private func createSubTitleTextView() {
        subtitleUITextView = UITextView()
        subtitleUITextView.backgroundColor = .red
        subtitleUITextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subtitleUITextView)
    }
    
    private func addConstraintForViews() {
        addConstraintsWith(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWith(format: "H:|-16-[v0(44)]|", views: userProfileImageView)
        addConstraintsWith(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        addConstraintsWith(format: "H:|[v0]|", views: separatorView)
        
        /// Title Label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        //Subtitle Text View
        NSLayoutConstraint.activate([
            subtitleUITextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleUITextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            subtitleUITextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            subtitleUITextView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

