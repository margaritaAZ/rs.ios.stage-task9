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
    var storyView = UIView()
    var imagesLeadingConstraint: NSLayoutConstraint?
    var imagesTrailingConstraint: NSLayoutConstraint?
    var imagesCenterXConstraint: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        titleLabel.attributedText = NSMutableAttributedString(string: storyData.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        typeLabel.text = storyData.type
        storyText.attributedText = NSMutableAttributedString(string: storyData.text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
//        storyText.text = storyData.text
        setupCoverImage()
        imageView.image = storyData.coverImage
        setupAnimationScrollView()
        setupStoryText()
        setConstraints()
    }
    
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        print("oldsize: \(view.bounds.size) new size: \(size)")
//        if view.bounds.size != size {
//            view.setNeedsUpdateConstraints()
//        }
//    }
//    
//    override func updateViewConstraints() {
//        if UIDevice.current.orientation.isLandscape {
//            imagesLeadingConstraint?.isActive = false
//            imagesTrailingConstraint?.isActive = false
//            imagesCenterXConstraint?.isActive = true
//        } else {
//            imagesLeadingConstraint?.isActive = true
//            imagesTrailingConstraint?.isActive = true
//            imagesCenterXConstraint?.isActive = false
//        }
//        super.updateViewConstraints()
//    }
    
    func setupAnimationScrollView() {
        animationScrollView = StrokeImagesView()
        animationScrollView.setupViews(paths: storyData.paths)
        contentView.addSubview(animationScrollView)
        animationScrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupStoryText() {
        storyView = UIView()
        storyView.layer.cornerRadius = 8
        storyView.layer.borderWidth = 1
        storyView.layer.borderColor = UIColor.white.cgColor

        storyText.numberOfLines = 0
        storyText.font = UIFont(name: "Rockwell-Regular", size: 24)
        storyText.textColor = .white
        storyText.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(storyView)
        storyView.translatesAutoresizingMaskIntoConstraints = false
        
        
        storyText.translatesAutoresizingMaskIntoConstraints = false
        storyView.addSubview(storyText)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        imagesLeadingConstraint =  animationScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        imagesTrailingConstraint = animationScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        imagesCenterXConstraint = animationScrollView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        NSLayoutConstraint.activate([animationScrollView.topAnchor.constraint(equalTo: line.topAnchor, constant: 40),
                                     animationScrollView.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([
                                        storyView.topAnchor.constraint(equalTo: animationScrollView.bottomAnchor, constant: 40),
                                        storyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                        storyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                        storyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)])
        NSLayoutConstraint.activate([storyText.topAnchor.constraint(equalTo: storyView.topAnchor, constant: 30),
                                     storyText.leadingAnchor.constraint(equalTo: storyView.leadingAnchor,constant: 30),
                                     storyText.trailingAnchor.constraint(equalTo: storyView.trailingAnchor, constant: -40),
                                     storyText.bottomAnchor.constraint(equalTo: storyView.bottomAnchor, constant: -30)])
        
//        if UIDevice.current.orientation == .portrait {
            NSLayoutConstraint.activate([
                                         imagesLeadingConstraint!,
                                         imagesTrailingConstraint!])
//        } else {
//            NSLayoutConstraint.activate([imagesCenterXConstraint!])
//        }
    }
    
    func getImagesLeadingConstraint() -> (leading: CGFloat, trailing: CGFloat)  {
        let leading = (view.safeAreaLayoutGuide.layoutFrame.width - animationScrollView.bounds.width - padding*2 - 30)/2
        let trailing = view.safeAreaLayoutGuide.layoutFrame.width - animationScrollView.bounds.width - leading - padding*2
        print(view.safeAreaLayoutGuide.layoutFrame.width, animationScrollView.bounds.width, leading, trailing)
        return (leading, trailing)
        
    }
    
}
