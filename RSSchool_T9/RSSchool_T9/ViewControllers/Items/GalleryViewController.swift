//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryViewController: ItemViewController {
    var galleryData: Gallery!
    var imageCollection: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        titleLabel.attributedText = NSMutableAttributedString(string: galleryData.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        typeLabel.text = galleryData.type
        setupCoverImage()
        imageView.image = galleryData.coverImage
        
        setupImages()
    }
    
    
    func setupImages() {
        imageCollection = UIView()
        contentView.addSubview(imageCollection)
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageCollection.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40),
                                     imageCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     imageCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     imageCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20

        for i in 0..<galleryData.images.count {
            let imageView = GalleryImageView()
            imageView.setupImage(galleryData.images[i])
            imageView.translatesAutoresizingMaskIntoConstraints = true
            let aspectRatio:CGFloat = 511/374
            let width = view.frame.size.width - 50
            
            imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: width*aspectRatio).isActive = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
            imageView.tag = i
            stackView.addArrangedSubview(imageView)
        }

        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageCollection.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: imageCollection.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: imageCollection.trailingAnchor),
                                     stackView.topAnchor.constraint(equalTo: imageCollection.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: imageCollection.bottomAnchor)])
        

    }
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        let imageVC = ImageDetailsViewController()
        imageVC.modalPresentationStyle = .overCurrentContext
        imageVC.image = galleryData.images[sender.view?.tag ?? 0]
        present(imageVC, animated: true, completion: nil)
    }
}
