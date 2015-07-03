//
//  UIImageView+AsyncImageView.h
//  ZuiiwatchApp
//
//  Created by HsuanYingHuang on 2015/6/23.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "AsyncImageView.h"
#import "ImageCache.h"

@interface UIImageView (AsyncImageView)


@property (nonatomic,retain) NSString *strTag;

- (void)setImageWithURLSting:(NSString *)url placeholderImage:(UIImage *)placeholder;
@end
