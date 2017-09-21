//
//  RedPacketView.m
//  redPacketView
//
//  Created by paradise_ on 2017/9/18.
//  Copyright © 2017年 YJGX. All rights reserved.
//

#import "RedPacketView.h"
#import "UIView+LYCViewExtension.h"
@implementation RedPacketView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    [self.openForeImageVIew addSubview:self.openImageView];
    self.openImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(makeRotate)];
    [self.openImageView addGestureRecognizer:tap];
    NSMutableAttributedString *mutAtr = [[NSMutableAttributedString alloc]initWithString:@"888.88元"];
    [mutAtr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19]} range:[@"888.88元" rangeOfString:@"元"]];
    self.tradeMoney.attributedText = mutAtr;
    
    
}
- (IBAction)seeDetailButtonClick:(id)sender {
    [self removeFromSuperview];
}
- (IBAction)remove:(id)sender {
    [self removeFromSuperview];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self];
////    if([self.openForeImageVIew cgre])
//    if(!CGRectContainsPoint(self.openForeImageVIew.frame, point)){
//        [self removeFromSuperview];
//    }
//}

+(instancetype)installRedPacketView{
    RedPacketView * redPacket = [RedPacketView viewFromXib];
    return redPacket;
}

-(UIImageView *)openImageView{
    if(!_openImageView){
        _openImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"开"]];
//        _openImageView.frame =
        _openImageView.bounds = self.tempImageView.bounds;
        _openImageView.center = [self.openForeImageVIew convertPoint:self.tempImageView.center fromView:self];
    }
    return _openImageView;
}

- (void)makeRotate{
    
    [UIView  animateWithDuration:1 animations:^{
        self.openImageView.layer.transform=CATransform3DMakeRotation(M_PI, 0, 1,0);
    } completion:^(BOOL finished) {
        [self.tempImageView removeFromSuperview];
        [self.openImageView removeFromSuperview];
        self.openForeImageVIew.image = [UIImage imageNamed:@"反面"];
        self.tradeMoney.hidden = NO;
        self.seeDetailButton.hidden = NO;
    }];
    
}
    
@end
