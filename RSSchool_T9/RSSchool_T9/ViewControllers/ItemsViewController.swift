//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 28.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsViewController: UIViewController {
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
        
        let flowLayout = ColumnFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        flowLayout.itemSize = CGSize(width: 179, height: 220)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView ?? UICollectionView())
        
        self.view = view
        
//        collectionView?.dataSource = self
//        collectionView?.delegate = self
    }
}

//extension ItemsViewController: UICollectionViewDataSource {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return FillingData.data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let imageCell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
//
//        let data = FillingData.data[indexPath.row]
//        switch data {
//        case .story(let storyItem):
//            imageCell.imageView.image = storyItem.coverImage
//        case .gallery(let galleryItem):
//            imageCell.imageView.image = galleryItem.coverImage
//        }
//
//        return imageCell
//    }
//
//}
//
//extension ItemsViewController: UICollectionViewDelegate {
//
//}
//
//
//extension ItemsViewController: UICollectionViewDelegateFlowLayout {
//    // 1
//      func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAt indexPath: IndexPath
//      ) -> CGSize {
//        // 2
////        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
////        let availableWidth = view.frame.width - paddingSpace
////        let widthPerItem = availableWidth / itemsPerRow
//
//        return CGSize(width: 179, height: 220)
//      }
//
//      // 3
//      func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAt section: Int
//      ) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//      }
//
//      // 4
//      func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        minimumLineSpacingForSectionAt section: Int
//      ) -> CGFloat {
//        return 5
//}
//}


