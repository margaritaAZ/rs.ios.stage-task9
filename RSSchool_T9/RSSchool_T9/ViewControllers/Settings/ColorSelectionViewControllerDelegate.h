//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ColorSelectionViewControllerDelegate <NSObject>

- (void) colorDidSelected: (NSString *) color;

@end

NS_ASSUME_NONNULL_END
