//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 31.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemViewController: UIViewController {
    var scrollView: UIScrollView!
    var typeLabel: UILabel = UILabel()
    var titleLabel: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    var closeButton: UIButton!
    var contentView: UIView!
    var line: UILabel!
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.black.withAlphaComponent(0).cgColor, UIColor.black.withAlphaComponent(1).cgColor]
        layer.cornerRadius = 8
        layer.locations = [0.60, 0.9, 1]
        return layer
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupScrollView()
        setupContentView()
        setupCloseButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = imageView.bounds
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
    }
    
    func setupContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        let contentHeightConstraint = contentView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor)
        contentHeightConstraint.priority = UILayoutPriority(1)
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
                                     contentView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
                                     contentHeightConstraint
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
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: UIControl.Event.touchUpInside)
    }
    
    @objc func closeButtonTapped(sender: UIButton) {
        dismiss(animated: true) {}
    }
    
    func setupCoverImage() {
        //      image
        imageView.image = UIImage("story-1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
                                     imageView.heightAnchor.constraint(equalToConstant: imageView.intrinsicContentSize.height),
                                     imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
        //        gradient
        
//        gradientLayer.frame = imageView.frame
        
        
        let gradientView = UIView()
        gradientView.layer.addSublayer(gradientLayer)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(gradientView)
        NSLayoutConstraint.activate([gradientView.topAnchor.constraint(equalTo: imageView.topAnchor),
                                     gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                                     gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
                                     gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)])
        
        //type
        typeLabel.textColor = .white
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
        typeLabel.layer.borderColor = UIColor.white.cgColor
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.cornerRadius = 8
        typeLabel.layer.backgroundColor = UIColor.black.cgColor
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typeLabel)
        NSLayoutConstraint.activate([typeLabel.widthAnchor.constraint(equalToConstant: typeLabel.intrinsicContentSize.width + 30*2),
                                     typeLabel.heightAnchor.constraint(equalToConstant: 40),
                                     typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                                     typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor)])
        
        
        
        
        // title
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 48)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        imageView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
                                     titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
                                     titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -40)])
        
        
        // line
        line = UILabel()
        line.backgroundColor = .white
        contentView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.widthAnchor.constraint(equalToConstant: 214).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 40).isActive = true
        line.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
    }
    
    
}
