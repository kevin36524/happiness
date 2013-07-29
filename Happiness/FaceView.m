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
    
    // get midpoint
    CGPoint midPoint;
    midPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    // get radius
#define DEFAULT_SCALE 0.9
    CGFloat size = self.bounds.size.width/2;
    if (self.bounds.size.height < self.bounds.size.width) {
        size = self.bounds.size.height/2;
    }
    size = size * DEFAULT_SCALE;
    
    // Draw face
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor] setStroke];
    [self drawCircleAtPoint:midPoint withRadius:size withContext:context];
    
    // define eye constants
#define EYE_X 0.35
#define EYE_Y 0.35
#define EYE_RAD 0.1
    
    CGPoint eyeCenter;
    eyeCenter.x = midPoint.x - size * EYE_X;
    eyeCenter.y = midPoint.y - size * EYE_Y;
    CGFloat eyeRadius = size * EYE_RAD;
    
    [self drawCircleAtPoint:eyeCenter withRadius:eyeRadius withContext:context];
    eyeCenter.x += size * 2 * EYE_X;
    [self drawCircleAtPoint:eyeCenter withRadius:eyeRadius withContext:context];
    
 
    // draw 2 eyes
    // mouth
}


@end
