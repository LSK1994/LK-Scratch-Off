//
//  ViewController.m
//  LK-Scratch-Off
//
//  Created by andaLK on 16/6/28.
//  Copyright © 2016年 anda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *downLabel;
@property (nonatomic, strong) UIImageView *topImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.downLabel = [[UILabel alloc]initWithFrame:CGRectMake(7, 50 , self.view.frame.size.width-14 , 400)];
    self.downLabel.text = @"《退后》\n天空灰得像哭过\n离开你以后 并没有更自由\n酸酸的空气\n守住我们的距离\n一幕醉心的结局\n像呼吸般无法停息\n";
    self.downLabel.numberOfLines = 0;
    self.downLabel.backgroundColor = [UIColor colorWithRed:(arc4random()%173)/346.0 + 0.5 green:(arc4random()%173)/346.0 + 0.5  blue:(arc4random()%173)/346.0 + 0.5  alpha: 1];
    self.downLabel.font = [UIFont systemFontOfSize:30];
    self.downLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.downLabel];
    
    self.topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(7, 50, self.view.frame.size.width-14, 400)];
    self.topImageView.image = [UIImage imageNamed:@"Jay"];
    [self.view addSubview:self.topImageView ];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 触摸屏幕任意地方
    UITouch *touch = touches.anyObject;
    // 触摸的地方在图片上的坐标
    CGPoint cententPoint = [touch locationInView:self.topImageView];
    // 设置"橡皮擦"的大小
    CGRect  rect = CGRectMake(cententPoint.x, cententPoint.y, 40, 40);
    // 默认创建一个透明的视图
    UIGraphicsBeginImageContextWithOptions(self.topImageView.bounds.size, NO, 0);
    // 获取上下文(画板)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 把imageView的layer映射到上下文中
    [self.topImageView.layer renderInContext:ref];
    // 清除划过的区域
    CGContextClearRect(ref, rect);
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图片的画板, (意味着图片在上下文中消失)
    UIGraphicsEndImageContext();
    self.topImageView.image = image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
