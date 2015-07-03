//
//  ImageCache.m
//  ZuiiwatchApp
//
//  Created by Polo Polo on 3/24/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import "ImageCache.h"

@implementation ImageCache
@synthesize imgCache;
#pragma mark - Methods
static ImageCache* sharedImageCache = nil;

+(ImageCache*)sharedImageCache
{
    @synchronized([ImageCache class])
    {
        if (!sharedImageCache)
            sharedImageCache= [[self alloc] init];

        return sharedImageCache;
    }

    return nil;
}

+(id)alloc
{
    @synchronized([ImageCache class])
    {
        NSAssert(sharedImageCache == nil, @"Attempted to allocate a second instance of a singleton.");
        sharedImageCache = [super alloc];

        return sharedImageCache;
    }

    return nil;
}

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        imgCache = [[NSCache alloc] init];
    }

    return self;
}

- (void) AddImage:(NSString *)imageURL :(UIImage *)image
{
    [imgCache setObject:image forKey:imageURL];
}

- (NSString*) GetImage:(NSString *)imageURL
{
    return [imgCache objectForKey:imageURL];
}

- (BOOL) DoesExist:(NSString *)imageURL
{
    if ([imgCache objectForKey:imageURL] == nil)
    {
        return false;
    }

    return true;
}

-(UIImage *)MainImage:(NSString *)path{

    UIImage *image;
    if ([[ImageCache sharedImageCache] DoesExist:path] == true)
    {
        image = [[ImageCache sharedImageCache] GetImage:path];
    }else{
        if ([path rangeOfString:@"http"].location != NSNotFound){
            
            NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:path]];
            image = [[UIImage alloc] initWithData:imageData];
            // Add the image to the cache
            if (image)
                [[ImageCache sharedImageCache] AddImage:path :image];
        }else{
            image = [UIImage imageNamed:path];
            // Add the image to the cache
            [[ImageCache sharedImageCache] AddImage:path :image];
        }
    }
    return  image;
}

- (void)emptyCache
{
    [imgCache removeAllObjects];
}
@end
