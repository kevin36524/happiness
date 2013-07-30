//
//  HappinessViewController.m
//  Happiness
//
//  Created by Kevin Patel on 7/29/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController () <FaceViewDataSouce>
@property (weak, nonatomic) IBOutlet FaceView *faceView;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

/* hooking my model's setter to redraw my view */
-(void) setHappiness:(int)happiness {
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

-(void) changeHappiness:(UIPanGestureRecognizer *) gr {
    if (gr.state == UIGestureRecognizerStateChanged || gr.state == UIGestureRecognizerStateEnded) {
        CGPoint trPoint = [gr translationInView:self.faceView];
        self.happiness -= trPoint.y/2;
        [gr setTranslation:CGPointZero inView:self.faceView];
    }
}

-(void) setFaceView:(FaceView *)faceView {
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeHappiness:)]];
    self.faceView.dataSource = self;
}

-(float) smileForFaceView:(FaceView *)sender {
    return ((self.happiness - 50) / 50.0);
}

@end
