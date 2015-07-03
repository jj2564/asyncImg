//
//  ImageCache.h
//  ZuiiwatchApp
//
//  Created by Polo Polo on 3/24/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ImageCache : NSObject
@property (nonatomic, retain) NSCache *imgCache;
#pragma mark - Methods
+ (ImageCache*)sharedImageCache;
- (void) AddImage:(NSString *)imageURL :(UIImage *)image;
- (UIImage*) GetImage:(NSString *)imageURL;
- (BOOL) DoesExist:(NSString *)imageURL;
- (void)emptyCache;
-(UIImage *)MainImage:(NSString *)path;
@end
