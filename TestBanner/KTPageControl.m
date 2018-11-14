//
//  KirotoPageControl.m
//  YiBaiSong
//
//  Created by kirito_song on 16/4/14.
//  Copyright © 2016年 yibaisong. All rights reserved.
//

#import "KTPageControl.h"


@interface KTPageControl()

@property (nonatomic, assign) CGSize currentSize;
@property (nonatomic, assign) CGSize defaultSize; //图标大小

@property (nonatomic, assign) NSInteger olderIndex;


#define dotW 16 // 圆点宽
#define dotH 8  // 圆点高
#define magrin 4    // 圆点间距
@end

@implementation KTPageControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)currentImage andDefaultImage:(UIImage *)defaultImage
{
    self = [super initWithFrame:frame];
    self.currentImage = currentImage;
    self.defaultImage = defaultImage;
    return self;
}

-(instancetype) init
{
    self = [super init];
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    //计算圆点间距
    CGFloat marginX = dotW + magrin;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++)
    {
        UIImageView* dot = [self.subviews objectAtIndex:i];

        if (i == self.currentPage)
        {
            [dot setFrame:CGRectMake(10 + i * marginX - (dotW - dotH)/2 , dot.frame.origin.y, dotW, dotH)];
        }
        else
        {
            [dot setFrame:CGRectMake(10 + i * marginX, dot.frame.origin.y, dotH, dotH)];
        }
        
//        UIImageView * imageView;
//
//        if(dot.subviews.count == 0)
//        {
//            imageView = [[UIImageView alloc]initWithFrame:dot.bounds];
//            [dot addSubview:imageView];
//        }
//        imageView = dot.subviews[0];
//        imageView.frame = dot.bounds;
//
//        if ( i == self.currentPage )
//        {
//            imageView.image=self.currentImage;
//        }
//        else
//        {
//            imageView.image = nil;
//        }
    }
}

@end
