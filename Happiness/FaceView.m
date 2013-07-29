//
//  FaceView.m
//  Happiness
//
//  Created by Kevin Patel on 7/29/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView

#define DEFAULT_SCALE 0.9
@synthesize scale = _scale;

- (CGFloat) scale {
    if (!_scale) {
        return DEFAULT_SCALE;
    } else {
        return _scale;
    }
}

- (void) setScale:(CGFloat)scale {
    if (_scale != scale) {
        _scale = scale;
        [self setNeedsDisplay];
    }
}

- (void) pinch:(UIPinchGestureRecognizer *)gr {
    if (gr.state == UIGestureRecognizerStateChanged || gr.state == UIGestureRecognizerStateEnded) {
        self.scale *= gr.scale;
        gr.scale = 1;
    }
}

- (void) setup {
    self.contentMode = UIViewContentModeRedraw;
}

- (void) awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
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

    CGFloat size = self.bounds.size.width/2;
    if (self.bounds.size.height < self.bounds.size.width) {
        size = self.bounds.size.height/2;
    }
    size = size * self.scale;
    
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
    
    // draw eyes
    [self drawCircleAtPoint:eyeCenter withRadius:eyeRadius withContext:context];
    eyeCenter.x += size * 2 * EYE_X;
    [self drawCircleAtPoint:eyeCenter withRadius:eyeRadius withContext:context];
    
    // mouth
#define MOUTH_X 0.45
#define MOUTH_Y 0.4
#define MOUTH_SMILE 0.25
    
    CGPoint startPoint;
    startPoint.x = midPoint.x - size * MOUTH_X;
    startPoint.y = midPoint.y + size * MOUTH_Y;
    CGPoint endPoint = startPoint;
    endPoint.x += size * 2 * MOUTH_X;
    CGPoint cp1 = startPoint;
    cp1.x += size * MOUTH_X * 2/3;
    CGPoint cp2 = endPoint;
    cp2.x -= size * MOUTH_Y * 2/3;
    
    float smile = -1.0;
    
    CGFloat smileOffset = smile * size * MOUTH_SMILE;
    cp1.y += smileOffset;
    cp2.y += smileOffset;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddCurveToPoint(context, cp1.x, cp1.y, cp2.x, cp2.y, endPoint.x, endPoint.y);
    CGContextSetLineWidth(context, 5.0);
    [[UIColor redColor] setStroke];
    CGContextStrokePath(context);
}




@end
