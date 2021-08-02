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
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 179, height: 220)
        flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 20, bottom: 50, right: 20)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        //        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView?.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        
        self.view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView?.delegate = self
    }
}

extension ItemsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        let imageCell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        //        imageCell.contentView.backgroundColor = .white
        imageCell.contentView.layer.borderColor = UIColor.black.cgColor
        imageCell.contentView.layer.borderWidth = 1
        imageCell.contentView.layer.cornerRadius = 18
        
        let data = FillingData.data[indexPath.row]
        switch data {
        case .story(let storyItem):
            imageCell.imageView.image = storyItem.coverImage
            imageCell.itemTitle.text = storyItem.title
            imageCell.itemType.text = storyItem.type
        case .gallery(let galleryItem):
            imageCell.imageView.image = galleryItem.coverImage
            imageCell.itemTitle.text = galleryItem.title
            imageCell.itemType.text = galleryItem.type
        }
        return imageCell
    }
    
}

extension ItemsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let modalViewController = StoryViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        
//        let data = FillingData.data[indexPath.row]
//        switch data {
//        case .story(let storyItem):
//            
//        case .gallery(let galleryItem):
//            
//        }
    }
    
}


extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        10
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        10
    //    }
}


