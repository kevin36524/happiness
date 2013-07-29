//
//  FaceView.m
//  Happiness
//
//  Created by Kevin Patel on 7/29/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat) radius withContext:(CGContextRef) context {
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, 1);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Drawing code
    // Draw face
    // draw 2 eyes
    // mouth
}


@end
