//****************************************************
// Copyright (c) 2011 January Technology Corporation
// Software Your Life(SYL) R&D Department
// Created by: CJH
// Created Date: 2011/01/06
// Purpose: Mobile Agent for iPad / iPhone
// ---------------------------------------------------
// $Date:
// $Revision:
// $Author:
// $Modified:
// ---------------------------------------------------
//****************************************************
//

#import <UIKit/UIKit.h>
#import "ImageCache.h"

typedef void (^UrlHandler)(NSString *strUrl);


@interface AsyncImageView : UIView
<NSURLConnectionDelegate>
{
    UrlHandler urlHandler;
	NSURLConnection* conn; //keep a reference to the connection for cancel download in dealloc
	NSMutableData* data; // keep reference to the data for collect it as it downloads
//	UIActivityIndicatorView *spinner;
//    UIImageView* imgView;
}

- (void)loadImageFromURL:(NSURL*)url
            saveFileName:(NSString*)saveFileName
        UrlHandler:(UrlHandler)handler;
- (void)cancelAsyncDownloading;
//- (UIImage*) image;
//- (void)setImageView:(UIImageView*)imageView;
//- (void)setImage:(UIImage*)image;

@end
