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
    var imageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .gray
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage("story-1")
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: contentView.topAnchor),
                                     bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     widthAnchor.constraint(equalToConstant: 179),
                                     heightAnchor.constraint(equalToConstant: 220)])
    }
    
}
