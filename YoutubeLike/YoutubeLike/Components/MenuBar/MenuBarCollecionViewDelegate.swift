//
//  MenuBarCollectionViewDelegate.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/27/23.
//

import UIKit

final class MenuBarCollectionViewDelegate: CollectionViewDelegates {
    
    var data: [String]
    var size: CGSize
    
    init(data: [String], size: CGSize = CGSize(width: 20, height: 20)) {
        self.data = data
        self.size = size
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(data.count)
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Abud", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
