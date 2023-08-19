//
//  VideoListCollectionViewCell.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideoListCollectionViewCell: UICollectionViewCell {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
