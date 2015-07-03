//
//  ViewController.h
//  asyncImgTest
//
//  Created by HsuanYingHuang on 2015/6/22.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AsyncImageView.h"

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
@private
    IBOutlet UITableView *tvImg;
    NSMutableArray* aryUrl;
}


@end

