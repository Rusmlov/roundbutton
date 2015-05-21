//
//  BetterButton.m
//  buttonsAndActionsTest
//
//  Created by Phablulo Joel on 27/04/15.
//  Copyright (c) 2015 Phablulo Joel. All rights reserved.
//

#import "BetterButton.h"

@implementation BetterButton

-(void)drawRect:(CGRect)rect{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height/2.0f;
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGFloat radius = self.frame.size.height / 2;
    CGFloat x = radius - point.x;
    CGFloat y = radius - point.y;
    if (x*x + y*y <= radius*radius){
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        anim.duration = 0.125;
        anim.repeatCount = 1;
        anim.autoreverses = YES;
        anim.removedOnCompletion = YES;
        anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)];
        [self.layer addAnimation:anim forKey:nil];
        return [super pointInside:point withEvent:event];
    }
    else
        return NO;
}

@end
