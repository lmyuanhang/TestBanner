//
//  BannerView.h
//  LiveVideoUI
//
//  Created by ghm on 16/6/15.
//  Copyright © 2016年 ghm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BannerDelegate <NSObject>

- (void) bannerSelect:(NSInteger) index;

@end

@interface BannerView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView* scroll;

@property (strong, nonatomic) NSTimer* timer;

//@property (strong, nonatomic) UIPageControl* pageControl;

@property id <BannerDelegate> delegate;

@property (strong, nonatomic) UIImage* currentPageImage;


- (id) initWithFrame:(CGRect)frame content:(NSMutableArray*) array;

@end
