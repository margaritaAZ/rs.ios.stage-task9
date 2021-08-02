//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StrokeImagesView: UIView {
    var scrollView = UIScrollView()
    var contentView = UIView()
    var stackView = UIStackView()
    

    func setupViews() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
//                                     scrollView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        let contentWidthConstraint = contentView.widthAnchor.constraint(equalTo: widthAnchor)
        contentWidthConstraint.priority = UILayoutPriority(1)
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentWidthConstraint,
                                     contentView.heightAnchor.constraint(equalTo: heightAnchor)
        ])

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 100

        let data = FillingData.data[0]
        var paths: [CGPath]!

        switch data {
        case .story(let storyItem):
            paths = storyItem.paths
        default:
            break
        }

        for path in paths {
            let animatedImage = StoryImageView()
            animatedImage.initWithPath(path)
            animatedImage.translatesAutoresizingMaskIntoConstraints = true
            animatedImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
            animatedImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
            stackView.addArrangedSubview(animatedImage)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
}
