//
//  ViewController.m
//  redPacketView
//
//  Created by paradise_ on 2017/9/18.
//  Copyright © 2017年 YJGX. All rights reserved.
//

#import "ViewController.h"

#import "RedPacketView.h"

@interface ViewController ()
@property (nonatomic,strong) UIImage  * image1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) UIImage  * image2;
//@property (nonatomic,strong) UIImage  * image1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self download2];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        while (1) {
//            
//            NSPort *macPort = [NSPort port];
//            NSLog(@"while begin");
//            NSRunLoop *subRunLoop = [NSRunLoop currentRunLoop];
//            [subRunLoop addPort:macPort forMode:NSDefaultRunLoopMode];
//            [subRunLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//            NSLog(@"while end");
//            NSLog(@"%@",subRunLoop);
//            
//        }    
//        
//    });

    
}
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    RedPacketView *red = [RedPacketView installRedPacketView];
    red.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.view addSubview:red];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)download2
{
    NSLog(@"----");
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //2.封装操作下载图片1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:@"http://h.hiphotos.baidu.com/zhidao/pic/item/6a63f6246b600c3320b14bb3184c510fd8f9a185.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //拿到图片数据
        self.image1 = [UIImage imageWithData:data];
    }];
    
    
    //3.封装操作下载图片2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://pic.58pic.com/58pic/13/87/82/27Q58PICYje_1024.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        //拿到图片数据
        self.image2 = [UIImage imageWithData:data];
    }];
    
    //4.合成图片
    NSBlockOperation *combine = [NSBlockOperation blockOperationWithBlock:^{
        
        //4.1 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        
        //4.2 画image1
        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        
        //4.3 画image2
        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        
        //4.4 根据图形上下文拿到图片数据
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        //        NSLog(@"%@",image);
        
        //4.5 关闭图形上下文
        UIGraphicsEndImageContext();
        
        //7.回到主线程刷新UI
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.imageView.image = image;
            NSLog(@"刷新UI---%@",[NSThread currentThread]);
        }];
        
    }];
    
    //5.设置操作依赖
    [combine addDependency:op1];
    [combine addDependency:op2];
    
    //6.添加操作到队列中执行
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:combine];
}


@end
