//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StrokeImagesView: UIView {
    var collectionView: UICollectionView!
    var paths: [CGPath]!
    var images: [StoryImageView]?
        
    func setupViews(paths: [CGPath]) {
        self.paths = paths
        for path in paths {
            let animatedImage = StoryImageView()
            animatedImage.initWithPath(path)
            animatedImage.addShapeLayer()
            if images == nil {
                images = [animatedImage]
            } else {
                images?.append(animatedImage)
            }
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 20)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 100
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     collectionView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension StrokeImagesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        guard let cellImages = images else {
            return cell
        }
        cell.addSubview(cellImages[indexPath.row])
        cellImages[indexPath.row].addAnimation()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paths.count
    }
}

extension StrokeImagesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cellImages = images else {
            return
        }
        cellImages[indexPath.row].removeAnimations()
        cellImages[indexPath.row].addAnimation()
    }
}
