//
//  DetailViewController.m
//  AnimationMaximize
//
//  Created by mayur on 7/31/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.labelForPlace.text = [NSString stringWithFormat:@"%@",[self.dictForData objectForKey:@"Place"]];
    self.labelForCountry.text = [NSString stringWithFormat:@"%@",[self.dictForData objectForKey:@"Country"]];
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.dictForData objectForKey:@"Image"]]];
    
    [self animateOnEntry];
}

- (void) animateOnEntry
{
    //set initial frames
    self.backgroundImageView.alpha = 0;
    self.backgroundImageView.frame = CGRectMake(0,
                                                self.yOrigin + MAIN_LABEL_Y_ORIGIN,
                                                self.view.frame.size.width,
                                                CGRectGetHeight(self.labelForPlace.frame) + CGRectGetHeight(self.labelForCountry.frame));
    self.labelForPlace.frame = CGRectMake(70,
                                          self.yOrigin + MAIN_LABEL_Y_ORIGIN,
                                          CGRectGetWidth(self.labelForPlace.frame),
                                          CGRectGetHeight(self.labelForPlace.frame));
    
    self.labelForCountry.frame = CGRectMake(70,
                                            self.labelForPlace.frame.origin.y + CGRectGetHeight(self.labelForPlace.frame),
                                            CGRectGetWidth(self.labelForCountry.frame),
                                            CGRectGetHeight(self.labelForCountry.frame));
    self.imageView.frame = CGRectMake(10,
                                      self.yOrigin + IMAGEVIEW_Y_ORIGIN,
                                      50,
                                      50);
    
    self.doneBtn.frame = CGRectMake(self.doneBtn.frame.origin.x,
                                    0-CGRectGetHeight(self.doneBtn.frame)-20,
                                    CGRectGetWidth(self.doneBtn.frame),
                                    CGRectGetHeight(self.doneBtn.frame));
    
    self.textviewForDetail.alpha = 0;
    self.textviewForDetail.frame = CGRectMake(self.textviewForDetail.frame.origin.x,
                                              CGRectGetHeight(self.textviewForDetail.frame) + CGRectGetHeight(self.view.frame),
                                              CGRectGetWidth(self.textviewForDetail.frame),
                                              CGRectGetHeight(self.textviewForDetail.frame));
    
    //apply animation on ENTERING INTO THE VIEW
    [UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         
                         self.labelForPlace.frame = CGRectMake(35,
                                                               180,
                                                               CGRectGetWidth(self.labelForPlace.frame),
                                                               CGRectGetHeight(self.labelForPlace.frame));
                         
                         self.labelForCountry.frame = CGRectMake(35,
                                                                 250,
                                                                 CGRectGetWidth(self.labelForCountry.frame),
                                                                 CGRectGetHeight(self.labelForCountry.frame));
                         
                         self.doneBtn.frame = CGRectMake(self.doneBtn.frame.origin.x,
                                                         20,
                                                         CGRectGetWidth(self.doneBtn.frame),
                                                         CGRectGetHeight(self.doneBtn.frame));
                         
                         self.backgroundImageView.frame = CGRectMake(0,
                                                                     0,
                                                                     CGRectGetWidth(self.view.frame),
                                                                     300);
                         self.backgroundImageView.alpha = 1;
                         
                         self.textviewForDetail.frame = CGRectMake(self.textviewForDetail.frame.origin.x,
                                                                   CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.textviewForDetail.frame),
                                                                   self.textviewForDetail.frame.size.width,
                                                                   self.textviewForDetail.frame.size.height);
                         self.textviewForDetail.alpha = 1;
                         
                         NSLog(@"width %f height %f", CGRectGetWidth(self.imageView.frame), CGRectGetHeight(self.imageView.frame));
                         
                         self.imageView.frame = CGRectMake(110,
                                                           50,
                                                           CGRectGetWidth(self.imageView.frame) * 2,
                                                           CGRectGetHeight(self.imageView.frame) * 2);
                     } completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneBtnPressed:(id)sender
{
    //animation on EXIT FROM CURRENT VIEW
    [UIView animateWithDuration:0.4f
                     animations:^{
                         
                         self.backgroundImageView.frame = CGRectMake(0,
                                                                     self.yOrigin + MAIN_LABEL_Y_ORIGIN,
                                                                     CGRectGetWidth(self.view.frame),
                                                                     CGRectGetHeight(self.labelForPlace.frame) + CGRectGetHeight(self.labelForCountry.frame));
                         
                         self.labelForPlace.frame = CGRectMake(70,
                                                               self.yOrigin + MAIN_LABEL_Y_ORIGIN,
                                                               CGRectGetWidth(self.labelForPlace.frame),
                                                               CGRectGetHeight(self.labelForPlace.frame));
                         
                         self.labelForCountry.frame = CGRectMake(70,
                                                                 self.labelForPlace.frame.origin.y + CGRectGetHeight(self.labelForPlace.frame),
                                                                 CGRectGetWidth(self.labelForCountry.frame),
                                                                 CGRectGetHeight(self.labelForCountry.frame));
                         
                         self.imageView.frame = CGRectMake(10,
                                                           self.yOrigin + IMAGEVIEW_Y_ORIGIN,
                                                           CGRectGetWidth(self.imageView.frame) / 2,
                                                           CGRectGetHeight(self.imageView.frame) / 2);
                         
                         self.doneBtn.frame = CGRectMake(self.doneBtn.frame.origin.x,
                                                         0 - CGRectGetHeight(self.doneBtn.frame) - 20,
                                                         CGRectGetWidth(self.doneBtn.frame),
                                                         CGRectGetHeight(self.doneBtn.frame));
                         
                         self.textviewForDetail.frame = CGRectMake(self.textviewForDetail.frame.origin.x,
                                                                   CGRectGetHeight(self.textviewForDetail.frame) + CGRectGetHeight(self.view.frame),
                                                                   CGRectGetWidth(self.textviewForDetail.frame),
                                                                   CGRectGetHeight(self.textviewForDetail.frame));
                         self.textviewForDetail.alpha = 0;
                         
                         self.backgroundImageView.alpha = 0;
                     } completion:^(BOOL finished){
                         
                         [self.navigationController popViewControllerAnimated:NO];
                     }];
}

@end
