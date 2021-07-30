//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "ColorSelectionViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColorSelectionViewController : UIViewController
@property (nonatomic, copy) NSString *selectedColor;
@property (nonatomic, strong) id<ColorSelectionViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
