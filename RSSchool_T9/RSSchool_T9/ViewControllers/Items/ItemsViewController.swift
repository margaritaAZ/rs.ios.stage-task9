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
        
        setupCollectionView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
            coordinator.animate(
                alongsideTransition: {_ in
                    self.collectionView.reloadData()
                },
                completion: nil
            )
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 20, bottom: 50, right: 20)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView?.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     collectionView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     collectionView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     collectionView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     collectionView.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
        
        self.view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView?.delegate = self
    }
}

//MARK: UICollectionViewDataSource
extension ItemsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
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

//MARK: UICollectionViewDelegate
extension ItemsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = FillingData.data[indexPath.row]
        switch data {
        case .story(let storyItem):
            let storyVC = StoryViewController()
            storyVC.storyData = storyItem
            storyVC.modalPresentationStyle = .overCurrentContext
            present(storyVC, animated: true, completion: nil)
        case .gallery(let galleryItem):
            let galleryVC = GalleryViewController()
            galleryVC.galleryData = galleryItem
            galleryVC.modalPresentationStyle = .overCurrentContext
            present(galleryVC, animated: true, completion: nil)
        }
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let aspectRatio:CGFloat = 220/179
        let paddings:CGFloat = 50
        let freeWidth = collectionView.frame.size.width - paddings
        var itemWidth = freeWidth/2
        var itemHeight = itemWidth*aspectRatio
        
        if UIDevice.current.orientation.isLandscape{
            itemHeight = collectionView.frame.size.height - paddings
            itemWidth = itemHeight/aspectRatio
        }
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}


