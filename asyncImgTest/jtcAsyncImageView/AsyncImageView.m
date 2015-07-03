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


#import "AsyncImageView.h"

//#import "Utilities.h"


@implementation AsyncImageView
{
    NSString *m_saveFileName;
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        m_saveFileName = @"";
    }
    
    return self;
}

- (void)dealloc {
	[conn cancel];
}


- (void)cancelAsyncDownloading
{
    [conn cancel];
    
	data=nil;
}


- (void)loadImageFromURL:(NSURL*)url
            saveFileName:(NSString*)saveFileName
              UrlHandler:(UrlHandler)handler
{
    urlHandler = handler;
    m_saveFileName = saveFileName;
    
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:180.0];
	conn = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //notice how delegate set to self object

}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData
{
	if (data==nil) {
        data = [[NSMutableData alloc] initWithCapacity:2048];
    }
	[data appendData:incrementalData];
}


- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection
{
	conn=nil;
    NSString *strConn = [[[theConnection currentRequest] URL] absoluteString];
    if ([data length] / 1024.f > 1 && [strConn isEqualToString:m_saveFileName])
    {
        UIImage *tmpImg = [[UIImage alloc] initWithData:data];
        if (tmpImg)
            [[ImageCache sharedImageCache] AddImage:m_saveFileName :tmpImg];
    }
    
	data=nil;
    urlHandler(strConn);
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [conn cancel];
    
    conn=nil;
    data=nil;
    
    [[ImageCache sharedImageCache].imgCache removeObjectForKey:m_saveFileName];
    
}

@end
