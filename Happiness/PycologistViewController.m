//
//  PycologistViewController.m
//  Happiness
//
//  Created by Kevin Patel on 7/31/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "PycologistViewController.h"
#import "HappinessViewController.h"

@interface PycologistViewController ()
@property (nonatomic) int diagnosis;
@end

@implementation PycologistViewController

- (void) updateAndShowDiagnosis: (int) diagnosis {
    self.diagnosis = diagnosis;
    [self performSegueWithIdentifier:@"diagnosisSegue" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"diagnosisSegue"]) {
        [segue.destinationViewController setHappiness:self.diagnosis];
    }
}

- (IBAction)fighting {
    [self updateAndShowDiagnosis:0];
}

- (IBAction)meditating {
    [self updateAndShowDiagnosis:60];
}

- (IBAction)appMaker {
    [self updateAndShowDiagnosis:100];
}

@end
