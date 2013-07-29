//
//  HappinessViewController.m
//  Happiness
//
//  Created by Kevin Patel on 7/29/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController ()
@property (weak, nonatomic) IBOutlet FaceView *faceView;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

@end
