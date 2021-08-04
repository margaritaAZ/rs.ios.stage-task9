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
    var stackView = UIStackView()
    var width:CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        titleLabel.attributedText = NSMutableAttributedString(string: galleryData.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        typeLabel.text = galleryData.type
        setupCoverImage()
        imageView.image = galleryData.coverImage
        
            if UIDevice.current.orientation.isLandscape {
                width = view.safeAreaLayoutGuide.layoutFrame.size.height - padding*2
            } else {
                width = view.safeAreaLayoutGuide.layoutFrame.size.width - padding*2
            }
            
        setupImages()
        setConstraints()
    }
    
    func setupImages() {
        imageCollection = UIView()
        contentView.addSubview(imageCollection)
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 20

        for i in 0..<galleryData.images.count {
            let imageView = GalleryImageView()
            imageView.setupImage(galleryData.images[i])
            imageView.image.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = true
            
            let aspectRatio:CGFloat = 511/374

            imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: width*aspectRatio).isActive = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
            imageView.tag = i
            stackView.addArrangedSubview(imageView)
        }

        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageCollection.addSubview(stackView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        NSLayoutConstraint.activate([imageCollection.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40),
                                     imageCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     imageCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     imageCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: imageCollection.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: imageCollection.bottomAnchor),
                                     stackView.widthAnchor.constraint(equalToConstant: width),
                                        stackView.centerXAnchor.constraint(equalTo: imageCollection.centerXAnchor)])
    }
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        let imageVC = ImageDetailsViewController()
        imageVC.modalPresentationStyle = .overCurrentContext
        imageVC.image = galleryData.images[sender.view?.tag ?? 0]
        present(imageVC, animated: true, completion: nil)
    }
}
