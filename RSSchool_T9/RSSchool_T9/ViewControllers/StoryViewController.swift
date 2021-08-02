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
    var storyText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimationScrollView()
        setupStoryText()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        scrollView.contentSize = contentView.frame.size
        //        scrollView.contentSize = CGSize(width: 414, height: 1595)
        //        animationScrollView.contentSize = CGSize(width: 495, height: 100)
    }
    
    
    func setupAnimationScrollView() {
        animationScrollView = StrokeImagesView()
        animationScrollView.setupViews()
        contentView.addSubview(animationScrollView)
        animationScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([animationScrollView.topAnchor.constraint(equalTo: line.topAnchor, constant: 40),
                                     animationScrollView.heightAnchor.constraint(equalToConstant: 100),
                                     animationScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     animationScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
        //        animationScrollView = UIScrollView()
        //        animationScrollView.backgroundColor = .white
        //        contentView.addSubview(animationScrollView)
        //        animationScrollView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([animationScrollView.topAnchor.constraint(equalTo: line.topAnchor, constant: 40),
        //                                     animationScrollView.heightAnchor.constraint(equalToConstant: 100),
        //                                     animationScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        //                                     animationScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        //        
        //        scrollContent = UIView()
        //        scrollContent.translatesAutoresizingMaskIntoConstraints = false
        //        animationScrollView.addSubview(scrollContent)
        //        NSLayoutConstraint.activate([scrollContent.topAnchor.constraint(equalTo: animationScrollView.topAnchor),
        //                                     scrollContent.bottomAnchor.constraint(equalTo: animationScrollView.bottomAnchor),
        //                                     scrollContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        //                                     scrollContent.widthAnchor.constraint(equalToConstant: 495),
        //                                     scrollContent.heightAnchor.constraint(equalTo: animationScrollView.heightAnchor)
        //        ])
        //
        //        let stackView = UIStackView()
        //        stackView.axis = .horizontal
        //        stackView.distribution = .equalSpacing
        //        stackView.spacing = 100
        //
        //        let data = FillingData.data[0]
        //        var paths: [CGPath]!
        //
        //        switch data {
        //        case .story(let storyItem):
        //            paths = storyItem.paths
        //        default:
        //            break
        //        }
        //
        //        for path in paths {
        //            let animatedImage = StoryImageView()
        //            animatedImage.initWithPath(path)
        //            stackView.addArrangedSubview(animatedImage)
        //        }
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        scrollContent.addSubview(stackView)
        //        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 50),
        //                                     stackView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
        //                                     stackView.topAnchor.constraint(equalTo: scrollContent.topAnchor),
        //                                     stackView.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor)])
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
