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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapOnView(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        scrollView.delegate = self
    }
    
    func setupContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        let contentHeightConstraint = contentView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor)
        contentHeightConstraint.priority = UILayoutPriority(1)
        NSLayoutConstraint.activate([contentView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     contentView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     contentView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     contentView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    func setupCloseButton() {
        closeButton = UIButton(type: UIButton.ButtonType.custom)
        let buttonImage = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(buttonImage, for: .normal)
        closeButton.layer.borderWidth = 1
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.layer.cornerRadius = 20
        
        closeButton.contentVerticalAlignment = .center
        closeButton.contentHorizontalAlignment = .center
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
        
        NSLayoutConstraint.activate([scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                                     scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
                                     scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
                                     scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
                                     scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: scrollView.contentLayoutGuide.widthAnchor),
                                     scrollView.frameLayoutGuide.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor)
        ])
        
        
        imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)])
        
        
    }
    
    @objc private func didTapOnView(_ sender: UITapGestureRecognizer) {
        closeButton.isHidden = !closeButton.isHidden
    }
}

extension ImageDetailsViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
