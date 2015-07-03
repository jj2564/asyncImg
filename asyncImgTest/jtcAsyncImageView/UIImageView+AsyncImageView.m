//
//  UIImageView+AsyncImageView.m
//  ZuiiwatchApp
//
//  Created by HsuanYingHuang on 2015/6/23.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "UIImageView+AsyncImageView.h"


@implementation UIImageView (AsyncImageView)
@dynamic  strTag;

NSString * const strConstTag = @"strConstTag";

- (void)setImageWithURLSting:(NSString *)url placeholderImage:(UIImage *)placeholder{
    self.strTag = url;
    self.image = placeholder;
    [self setClipsToBounds:YES];
    
    //其實不再需要使用繼承UIImageView的class了，只是一時懶得開新的
    AsyncImageView *imageView = [[AsyncImageView alloc] init];
    if (url) {
        if ([[ImageCache sharedImageCache] DoesExist:url] == true)
        {
            self.image = [[ImageCache sharedImageCache] GetImage:url];
        }
        else {
            [imageView loadImageFromURL:[NSURL URLWithString:url] saveFileName:url UrlHandler:^(NSString* str) {
                if ([str isEqualToString:self.strTag]) {
                    self.image = [[ImageCache sharedImageCache] GetImage:url];
                }
            }];
        }
    }
}

- (void)setStrTag:(NSString *)strTag
{
    objc_setAssociatedObject( self, &strConstTag, strTag, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)strTag
{
    return objc_getAssociatedObject(self, &strConstTag);
}
@end
