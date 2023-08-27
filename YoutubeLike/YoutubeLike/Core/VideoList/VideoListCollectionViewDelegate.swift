//
//  VideoListCollectionViewDelegates.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/19/23.
//

import UIKit

final class VideoListCollectionViewDelegates: CollectionViewDelegates {
    
    var videos: [Video]
    
    init(videos: [Video]) {
        self.videos = videos
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoListCollectionViewCell.identifier, for: indexPath) as! VideoListCollectionViewCell
        cell.setup(forVideo: videos[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return VideoListCollectionViewCell.size
    }
}
