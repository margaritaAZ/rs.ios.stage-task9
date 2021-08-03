//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 3.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryImageView: UIView {
    var image: UIImageView!
    
    func setupImage(_ imageName: UIImage) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
        
        image = UIImageView(image: imageName)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 4
        self.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([image.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                                     image.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10),
                                     image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                                     image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)])
        
    }

}
