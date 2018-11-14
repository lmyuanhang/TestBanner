//
//  BannerView.m
//  LiveVideoUI
//
//  Created by ghm on 16/6/15.
//  Copyright © 2016年 ghm. All rights reserved.
//

#import "BannerView.h"
#import "CommonDefine.h"

#import "KTPageControl.h"

const static CGFloat kPageWidth = 120;
const static CGFloat kPageHeight = 20;

const static NSInteger KTimerInterval = 2;

@interface BannerView ()

@property (nonatomic, strong) KTPageControl* pageControl;
//@property (strong,nonatomic) KTPageControl *pageControl;

@end

@implementation BannerView

- (id) initWithFrame:(CGRect)frame content:(NSMutableArray*) array
{
    if(self = [super initWithFrame:frame])
    {
    }
    
    _scroll = [[UIScrollView alloc]initWithFrame: frame];
    
    [self addSubview:_scroll];
    
    //    图片的宽
    CGFloat imageW = frame.size.width;
    //    图片高
    CGFloat imageH = frame.size.height;
    //    图片的Y
     CGFloat imageY = 0;
    
    //    图片中数
    NSInteger totalCount = [array count];
    
    //   1.添加5张图片
    for (int i = 0; i < totalCount; i++)
    {

        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        //        图片X
        CGFloat imageX = i * imageW;
        //        设置frame
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        //        设置图片
        NSString *name = [NSString stringWithFormat:@"img_0%d", i + 1];
                 imageView.image = [UIImage imageNamed:name];
        //        隐藏指示条
        switch (i)
        {
                
            case 0:
            {
                imageView.backgroundColor = [UIColor brownColor];
                break;
            }
            case 1:
            {
                imageView.backgroundColor = [UIColor greenColor];
                break;
            }
            case 2:
            {
                imageView.backgroundColor = [UIColor magentaColor];
                break;
            }
                
            default:
                break;
        }
        
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i + 1;
        btn.backgroundColor = [UIColor clearColor];
        btn.frame = CGRectMake(0, 0, imageW, imageH);
        [btn addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
        
        [imageView addSubview:btn];
        
        _scroll.showsHorizontalScrollIndicator = NO;
    
        [_scroll addSubview:imageView];
    }
    
    [self addSubview:self.pageControl];
//    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kMainScreenWidth - kPageWidth - 10,
//                                                                   frame.size.height - kPageHeight,
//                                                                   kPageWidth,
//                                                                   kPageHeight)];
//    _pageControl.backgroundColor = [UIColor clearColor];
//
//    UIPageControl *pageControl = [[UIPageControl alloc] init];
//
////    [pageControl setValue:[UIImage imageNamed:@"gg"] forKeyPath:@"_pageImage"];
//
//    [pageControl setValue:[UIImage imageNamed:@"sss"] forKeyPath:@"_currentPageImage"];
//
//
////    _pageControl.currentPageIndicatorTintColor = kColorHex(0xffc001);
////    _pageControl.pageIndicatorTintColor = kColorHex(0xdddddd);
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = [array count];
    _pageControl.backgroundColor = [UIColor grayColor];
    
//    [self addSubview:_pageControl];
    
    //    2.设置scrollview的滚动范围
    CGFloat contentW = totalCount *imageW;
    //不允许在垂直方向上进行滚动
    _scroll.contentSize = CGSizeMake(contentW, 0);
    
    //    3.设置分页
    _scroll.pagingEnabled = YES;
    
    //    4.监听scrollview的滚动
    _scroll.delegate = self;
    
    [self addTimer];
    
    return self;
}

- (void) select:(UIButton*)btn
{
    if([self.delegate respondsToSelector:@selector(bannerSelect:)])
    {
        [self.delegate bannerSelect:btn.tag];
    }
}

- (void)nextImage
{
    int page = (int)_pageControl.currentPage;
    if (page == _pageControl.numberOfPages - 1)
    {
        page = 0;
    }
    else
    {
        page++;
    }

    //  滚动scrollview
    CGFloat x = page * self.frame.size.width;
    _scroll.contentOffset = CGPointMake(x, 0);
}

// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"滚动中");
    //    计算页码
    //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    _pageControl.currentPage = page;
}

// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    //    [self.timer invalidate];
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    开启定时器
    [self addTimer];
}

/**
*  开启定时器
*/
- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:KTimerInterval target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

/**
*  关闭定时器
*/
- (void)removeTimer
{
    [_timer invalidate];
}

- (KTPageControl *)pageControl
{
    if (_pageControl == nil) {
        
        _pageControl = [[KTPageControl alloc] init];
        _pageControl.frame = CGRectMake(kMainScreenWidth - kPageWidth - 10,
                                       self.frame.size.height - kPageHeight,
                                       kPageWidth,
                                        kPageHeight);
        
        //有图片显示图片、没图片则显示设置颜色
        _pageControl.pageIndicatorTintColor =[UIColor yellowColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
//        _pageControl.currentImage =[UIImage imageNamed:@"gg"];
        //        _pageControl.defaultImage =[UIImage imageNamed:@"detail_piclunbounselec_suiji"];
        
        //设置pageSize以设置为准、否则以图片大小为准、图片也没有默认7*7...
//        _pageControl.pageSize = CGSizeMake(12, 12);
        
        
        _pageControl.numberOfPages = 5;
        _pageControl.currentPage = 0;
        
        
    }
    return _pageControl;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
