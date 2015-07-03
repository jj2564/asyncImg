//
//  ViewController.m
//  asyncImgTest
//
//  Created by HsuanYingHuang on 2015/6/22.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    aryUrl = [[NSMutableArray alloc] init];
    
    
    //有些圖片可能會失效，可以更換成其他網路圖片
    [aryUrl addObject:@"http://demsblog.com/wp-content/uploads/2013/11/red-number-1-1024x819.jpeg"];
    [aryUrl addObject:@"http://www.psdgraphics.com/file/red-number-2.jpg"];
    
    [aryUrl addObject:@"http://www.iosefina.eu/images/9/9e/0023-JPEG.jpeg"];
    
    [aryUrl addObject:@"http://www.theintentionallife.com/wp-content/uploads/2014/12/4.jpg"];
    
    [aryUrl addObject:@"http://clareluffman.com/wp-content/uploads/2013/10/red-number-5.jpg"];
    
    [aryUrl addObject:@"http://demsblog.com/wp-content/uploads/2013/11/red-number-1-1024x819.jpeg"];
    [aryUrl addObject:@"http://www.psdgraphics.com/file/red-number-2.jpg"];
    
    [aryUrl addObject:@"http://www.iosefina.eu/images/9/9e/0023-JPEG.jpeg"];
    
    [aryUrl addObject:@"http://www.theintentionallife.com/wp-content/uploads/2014/12/4.jpg"];
    
    [aryUrl addObject:@"http://clareluffman.com/wp-content/uploads/2013/10/red-number-5.jpg"];
    
    [aryUrl addObject:@"http://demsblog.com/wp-content/uploads/2013/11/red-number-1-1024x819.jpeg"];
    [aryUrl addObject:@"http://www.psdgraphics.com/file/red-number-2.jpg"];
    
    [aryUrl addObject:@"http://www.iosefina.eu/images/9/9e/0023-JPEG.jpeg"];
    
    [aryUrl addObject:@"http://www.theintentionallife.com/wp-content/uploads/2014/12/4.jpg"];
    
    [aryUrl addObject:@"http://clareluffman.com/wp-content/uploads/2013/10/red-number-5.jpg"];
    
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 100;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier= [NSString stringWithFormat:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
 
    
    NSInteger nX = [indexPath row];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIImageView *imageView1 = [[UIImageView alloc] init];
        imageView1.tag = 10;
        imageView1.contentMode = UIViewContentModeScaleAspectFill;
        imageView1.frame = CGRectMake(0,0,100,100);
        imageView1.layer.borderColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0].CGColor;
        imageView1.layer.borderWidth = 1.0f;
        [cell addSubview:imageView1];
    }

    UIImageView *img = (UIImageView*)[cell viewWithTag:10];
    //前面帶入網址（字串） 後面帶入想要預設的底圖
    [img setImageWithURLSting:aryUrl[nX] placeholderImage:nil];


    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
