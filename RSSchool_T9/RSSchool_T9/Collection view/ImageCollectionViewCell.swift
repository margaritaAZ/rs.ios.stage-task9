//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 28.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var itemType: UILabel!
    var itemTitle:UILabel!
    var gradientLayer:CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        itemType = UILabel()
        itemTitle = UILabel()
        gradientLayer = CAGradientLayer()
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
//      image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                                     imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                                     imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
        
//        gradient
        gradientLayer.frame = contentView.frame
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0).cgColor, UIColor.black.withAlphaComponent(1).cgColor]

        gradientLayer.cornerRadius = 8
        gradientLayer.locations = [0.65, 0.9, 1]
        
        
        let gradientView = UIView()
        gradientView.layer.addSublayer(gradientLayer)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(gradientView)
        NSLayoutConstraint.activate([gradientView.topAnchor.constraint(equalTo: imageView.topAnchor),
                                     gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                                     gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
                                     gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)])

        
        
        
// title label
        itemTitle.textColor = .white
        itemTitle.font = UIFont(name: "Rockwell-Regular", size: 16)
        itemTitle.contentHuggingPriority(for: .vertical)
        
        gradientView.addSubview(itemTitle)
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([itemTitle.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 150),
                                        itemTitle.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30),
                                     itemTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
                                     itemTitle.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)])
//        type label
        itemType.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        itemType.font = UIFont(name: "Rockwell-Regular", size: 12)
        itemType.contentHuggingPriority(for: .vertical)
        
        gradientView.addSubview(itemType)
        itemType.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([itemType.heightAnchor.constraint(equalToConstant: 14),
                                     itemType.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
                                     itemType.leadingAnchor.constraint(equalTo: itemTitle.leadingAnchor),
                                     itemType.trailingAnchor.constraint(equalTo: itemTitle.trailingAnchor)])
    }
    
}
