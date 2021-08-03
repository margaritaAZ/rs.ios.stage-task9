//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ImageDetailsViewController: UIViewController {
    var imageView: UIImageView!
    var closeButton: UIButton!
    var contentView: UIView!
    var scrollView: UIScrollView!
    var image: UIImage = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupContentView()
        setupImage()
        setupCloseButton()
    }
    
    func setupContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        let contentHeightConstraint = contentView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor)
        contentHeightConstraint.priority = UILayoutPriority(1)
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: view.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    func setupCloseButton() {
        closeButton = UIButton(type: UIButton.ButtonType.custom)
        let buttonImage = UIImage(systemName: "xmark.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .thin))?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(buttonImage, for: .normal)
        
        closeButton.contentVerticalAlignment = .fill
        closeButton.contentHorizontalAlignment = .fill
        closeButton.imageEdgeInsets = .zero
        closeButton.tintColor = .white
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(closeButton)
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: UIControl.Event.touchUpInside)
    }
    
    @objc func closeButtonTapped(sender: UIButton) {
        dismiss(animated: true) {}
    }

    
    func setupImage() {
        scrollView = UIScrollView()
        scrollView.maximumZoomScale = 3
        scrollView.isScrollEnabled = false
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
//                                     scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                                     scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                                     scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        NSLayoutConstraint.activate([scrollView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     scrollView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     scrollView.heightAnchor.constraint(equalToConstant: 552),
                                     scrollView.widthAnchor.constraint(equalToConstant: 414)])
        
        imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
                                     imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
        
    }

}
