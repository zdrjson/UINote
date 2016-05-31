//
//  MyView.m
//  Quartz
//
//  Created by qianfeng on 14-11-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyView.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //画线
    [self drawLine];
    
    //画多条线
//    [self drawLines];
    //点线
//    [self dashLine];
    //矩形
//    [self drawRectUI];
    
//    [self drawRectCG];
      //画圆
//    [self drawEllipse];
    //画扇形
//    [self drawArc];
    //文字
//    [self drawWord];
    //二阶贝赛尔曲线
//    [self bezier];
    //三阶贝赛尔曲线
//    [self bezier3];
}
-(void)bezier3
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(crf, 60, 300);
    //三阶贝赛尔曲线
    CGContextAddCurveToPoint(crf, 100, 100, 300, 400, 260, 300);
    
    CGContextAddLineToPoint(crf, 300, 400);
    
    CGContextAddLineToPoint(crf, 100, 100);
    
    CGContextAddLineToPoint(crf, 60, 300);
    
    CGContextStrokePath(crf);
}
-(void)bezier
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(crf, 60, 300);
    //二阶贝塞尔曲线
    CGContextAddQuadCurveToPoint(crf, 160, 100, 260, 300);
    
    CGContextAddLineToPoint(crf, 160, 100);
    
    CGContextAddLineToPoint(crf, 60, 300);
    
    CGContextFillPath(crf);
}
-(void)drawWord
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    //设置阴影
    //最后一个参数表示模糊度，值越大，越模糊
    CGContextSetShadow(crf, CGSizeMake(5, 5), 2);
    
   //将文字绘画到上下文
    [@"Hello world" drawAtPoint:CGPointMake(100, 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30],NSForegroundColorAttributeName:[UIColor greenColor]}];
    //设置带颜色的阴影
    CGContextSetShadowWithColor(crf, CGSizeMake(5, 5), 2, [UIColor blueColor].CGColor);
    
    CGContextAddRect(crf, CGRectMake(90, 100, 200, 40));
    
    CGContextStrokePath(crf);
}
-(void)drawArc
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    //前两个参数是表示原点
    //第三个参数：半径
    //第4.5个参数表示开始的角度和结束的角度
    //最后一个参数表示旋转的方向，0表示逆时针
    CGContextAddArc(crf, 160, 200, 100, M_PI/180.0*30, M_PI/180.0*150,0);
    
    
    
    CGContextStrokePath(crf);

}
-(void)drawEllipse
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(crf, 0, 1, 0, 1);
    //画圆
    CGContextAddEllipseInRect(crf, CGRectMake(60, 100, 200, 100));
    
    CGContextDrawPath(crf, kCGPathFillStroke);
    
    
}
-(void)drawRectCG
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    
    //画一个矩形
    CGContextAddRect(crf, CGRectMake(60, 100, 200, 100));
    
    //能将在之前添加的图形绘画出来，对后面添加的没有影响
    //在前面设置的属性对后面的图形依然有效
    CGContextStrokePath(crf); //只要调用这个方法，前面画的都结束
    
    CGContextSetRGBFillColor(crf, 1, 0, 1, 1);
    
    CGContextAddRect(crf, CGRectMake(55, 95, 200, 100));
    CGContextFillPath(crf);  //调用这个方法，从CGContextStrokePath开始下面画的图，所以只有一个画CGContextAddRect(crf, CGRectMake(55, 95, 200, 100));

}
//使用UI封装的画图
-(void)drawRectUI
{
    [[UIColor greenColor] setStroke];
    UIRectFrame(CGRectMake(60, 100, 200, 100));
    
    [[UIColor blueColor] setFill];
    UIRectFill(CGRectMake(55, 95, 200, 100));
    
}
-(void)dashLine
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    
    CGFloat ls[] = {20,3,10,10};
    //10：整体向左偏移的像素值
    //ls：是数组，表示所有的线长度的数组
    //count：表示数组中有效的数字的个数
    CGContextSetLineDash(crf, 10, ls, 3);
    
    CGContextSetLineWidth(crf, 10);
    
    CGContextMoveToPoint(crf, 50, 200);
        
    CGContextAddLineToPoint(crf, 260, 200);
    
    CGContextStrokePath(crf);

}
-(void)drawLines
{
    CGContextRef crf = UIGraphicsGetCurrentContext();
    //存放所有点的坐标
    CGPoint ps[] = {CGPointMake(100, 100),CGPointMake(100, 300),CGPointMake(300, 200),CGPointMake(200, 100)};
    //count表示点的个数
    CGContextAddLines(crf, ps, 4);
    
    //设置填充的颜色
    CGContextSetRGBFillColor(crf, 0, 1, 0, 1);
    
    CGContextSetLineWidth(crf, 10);
    //设置线与线连接点的样式
    CGContextSetLineJoin(crf, kCGLineJoinRound);
    //设置线条本身的端点的样式
    CGContextSetLineCap(crf, kCGLineCapRound);
    
    //使用画线和填充
    CGContextDrawPath(crf, kCGPathFillStroke);
    //画线,如果画线了，就不会使用填充
//    CGContextStrokePath(crf);
    //画区域
//    CGContextFillPath(crf);
    
}
-(void)drawLine
{
    //绘图上下文：绘图的环境
    CGContextRef crf = UIGraphicsGetCurrentContext();
    //设置线条的粗细
    CGContextSetLineWidth(crf, 10);
    //设置线条的颜色
    CGContextSetRGBStrokeColor(crf, 0, 0, 1, 1);//Stroke画笔
    //移动当前的点：起始点
    CGContextMoveToPoint(crf, 100, 100);
    //画线的某一个点
    CGContextAddLineToPoint(crf, 300, 300);
    //使用画笔工具绘图
    CGContextStrokePath(crf);
    
}

@end
