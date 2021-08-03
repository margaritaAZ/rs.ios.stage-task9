//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryViewController: ItemViewController, UIScrollViewDelegate {
    var animationScrollView: StrokeImagesView!
    var scrollContent: UIView!
    var storyText: UILabel = UILabel()
    var storyData: Story!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        titleLabel.attributedText = NSMutableAttributedString(string: storyData.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        typeLabel.text = storyData.type
        storyText.attributedText = NSMutableAttributedString(string: storyData.text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        setupCoverImage()
        imageView.image = storyData.coverImage
        setupAnimationScrollView()
        setupStoryText()
    }
    
    
    func setupAnimationScrollView() {
        animationScrollView = StrokeImagesView()
        animationScrollView.setupViews(paths: storyData.paths)
        contentView.addSubview(animationScrollView)
        animationScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([animationScrollView.topAnchor.constraint(equalTo: line.topAnchor, constant: 40),
                                     animationScrollView.heightAnchor.constraint(equalToConstant: 100),
                                     animationScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     animationScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
    }
    
    func setupStoryText() {
        let storyView = UIView()
        storyView.layer.cornerRadius = 8
        storyView.layer.borderWidth = 1
        storyView.layer.borderColor = UIColor.white.cgColor
        
        storyText = UILabel()
        storyText.text = String.from("s1-text")
        storyText.numberOfLines = 0
        storyText.font = UIFont(name: "Rockwell-Regular", size: 24)
        storyText.textColor = .white
        storyText.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(storyView)
        storyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        storyView.topAnchor.constraint(equalTo: animationScrollView.bottomAnchor, constant: 40),
                                        storyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                        storyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                        storyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)])
        
        
        storyText.translatesAutoresizingMaskIntoConstraints = false
        storyView.addSubview(storyText)
        NSLayoutConstraint.activate([storyText.topAnchor.constraint(equalTo: storyView.topAnchor, constant: 30),
                                     storyText.leadingAnchor.constraint(equalTo: storyView.leadingAnchor,constant: 30),
                                     storyText.trailingAnchor.constraint(equalTo: storyView.trailingAnchor, constant: -40),
                                     storyText.bottomAnchor.constraint(equalTo: storyView.bottomAnchor, constant: -30)])
    }
}
