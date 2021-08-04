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
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.black.withAlphaComponent(0).cgColor, UIColor.black.withAlphaComponent(1).cgColor]
        layer.cornerRadius = 8
        layer.locations = [0.60, 0.9, 1]
        return layer
    }()
    
    var closeButton: UIButton!
    var typeLabel: UILabel = UILabel()
    var titleLabel: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    var line: UILabel = {
        let line = UILabel()
        line.backgroundColor = .white
        return line
    }()
    
    let padding: CGFloat = 20
    var coverImageWidthConstraint: NSLayoutConstraint?
    var coverImageHeightConstraint: NSLayoutConstraint?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupCloseButton()
        setupCoverImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = imageView.bounds
    }
    
    func setupCloseButton(){
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
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //        gradient
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
        
        // title
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 48)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        imageView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // label title
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
                                     titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
                                     titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -40)])
        
        // line
        contentView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
                                     line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
                                     line.heightAnchor.constraint(equalToConstant: 1),
                                     line.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 40),
                                     line.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
    
    }
    
    func setConstraints() {
        // scrollView to view
        NSLayoutConstraint.activate([scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: scrollView.contentLayoutGuide.widthAnchor)
        ])
        
        // contentView to scroll content
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: padding),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -padding)
        ])
        
        // close button
        NSLayoutConstraint.activate([closeButton.widthAnchor.constraint(equalToConstant: 40),
                                     closeButton.heightAnchor.constraint(equalToConstant: 40),
                                     closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                                     closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)])
        
        // label type
        NSLayoutConstraint.activate([typeLabel.widthAnchor.constraint(equalToConstant: typeLabel.intrinsicContentSize.width + 30*2),
                                     typeLabel.heightAnchor.constraint(equalToConstant: 40),
                                     typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                                     typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor)])
        
        //imageView
        let aspectRatio: CGFloat = 518/374
        var width = view.safeAreaLayoutGuide.layoutFrame.size.width - padding*2
        if UIDevice.current.orientation.isLandscape {
            width = view.safeAreaLayoutGuide.layoutFrame.size.height - padding*2
        }
        let height = width*aspectRatio
        coverImageWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: width)
        coverImageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: height)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
                                     imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     coverImageWidthConstraint!, coverImageHeightConstraint!])
        

    }
    
    
}
