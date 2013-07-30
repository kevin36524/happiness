//
//  FaceView.h
//  Happiness
//
//  Created by Kevin Patel on 7/29/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FaceView;

@protocol FaceViewDataSouce
- (float) smileForFaceView:(FaceView *)sender;
@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void) pinch:(UIPinchGestureRecognizer *)gr;
@property (nonatomic, weak) IBOutlet id <FaceViewDataSouce> dataSource;

@end
