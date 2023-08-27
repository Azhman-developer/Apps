//
//  VideoListCollectionViewCell.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideoListCollectionViewCell: UICollectionViewCell {
 
    static var size: CGSize {
        //All the video ratios are 16 by 9
        //1920 / 1080 = 1.7778
        //1280 / 720 = 1.7778
        //16 / 9 = 1.7778
        let horizontalConstraints: CGFloat = 16 * 2
        let aspectRatio: CGFloat = 9 / 16
        let thumbnailVerticalConstraint = 16
        let userProfileVerticalConstraint = 8
        let titleLabelHeight = 20
        let subTitleTextViewHeight = 30
        let labelAndTextViewVerticalConstraint = 4
        let bottomSeparatorConstraint = 16
        let titleLabelTopConstraint = 8
        let verticalFilledByConstraints = thumbnailVerticalConstraint + userProfileVerticalConstraint + titleLabelHeight + subTitleTextViewHeight +
        labelAndTextViewVerticalConstraint + bottomSeparatorConstraint + titleLabelTopConstraint
        let height = ((UIScreen.main.bounds.width - horizontalConstraints) * aspectRatio ) + CGFloat(verticalFilledByConstraints)
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
    
    private var thumbnailImageView: UIImageView!
    private var separatorView: UIView!
    private var userProfileImageView: UIImageView!
    private var titleLabel: UILabel!
    private var subtitleUITextView: UITextView!
        
    private let userProfileImageViewWith = 44
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createViews()
    }
}

// MARK: - Creating Views functions
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
        thumbnailImageView.image = UIImage(named: "Queen")
        addSubview(thumbnailImageView)
    }
    
    private func createSeparatorView() {
        separatorView = UIView()
        addSubview(separatorView)
    }
    
    private func createUserProfileImageView() {
        userProfileImageView = UIImageView()
        addSubview(userProfileImageView)
    }
    
    private func createTitleLabel() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
    }
    
    private func createSubTitleTextView() {
        subtitleUITextView = UITextView()
        subtitleUITextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subtitleUITextView)
    }
    
    private func addConstraintForViews() {
        addConstraintsWith(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWith(format: "H:|-16-[v0(\(userProfileImageViewWith))]|", views: userProfileImageView)
        addConstraintsWith(format: "V:|-16-[v0]-8-[v1(\(userProfileImageViewWith))]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
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
            subtitleUITextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleUITextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            subtitleUITextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            subtitleUITextView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

// MARK: - Filling Views Functions
extension VideoListCollectionViewCell {
    
    func setup(forVideo video: Video) {
        fillViews(withVideo: video)
    }
    
    private func fillViews(withVideo video: Video) {
        fillThumbnailImageView(withImageName: video.thumbnailImage)
        fillProfileImageView(withImageName: video.ownerProfileImage)
        fillTitleLabel(withText: video.title)
        fillSubTitleLabel(withText: video.description)
    }
    
    private func fillThumbnailImageView(withImageName imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
    }
    
    private func fillProfileImageView(withImageName imageName: String) {
        userProfileImageView.image = UIImage(named: imageName)
        userProfileImageView.contentMode = .scaleAspectFill
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.cornerRadius = CGFloat(userProfileImageViewWith / 2)
        userProfileImageView.layer.masksToBounds = true
    }
    
    private func fillTitleLabel(withText text: String) {
        titleLabel.text = text
    }
    
    private func fillSubTitleLabel(withText text: String) {
        subtitleUITextView.text = text
        subtitleUITextView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        subtitleUITextView.textColor = UIColor.lightGray
        subtitleUITextView.isScrollEnabled = false
    }

}
