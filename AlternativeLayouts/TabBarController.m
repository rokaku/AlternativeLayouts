//
//  TabBarController.m
//  AlternativeLayouts
//
//  Created by Charles Lu on 2015/1/30.
//  Copyright (c) 2015 Charles Lu. All rights reserved.
//

#import "TabBarController.h"

#define INTERFACE_ORIENTATION() ([[UIApplication sharedApplication]statusBarOrientation])
#define ISIOS7ANDABOVE() ([[UIDevice currentDevice] systemVersion].floatValue<8.0)
@interface TabBarController ()

@end

@implementation TabBarController

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
    // Do any additional setup after loading the view.
    [self.tabBar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) adaptToOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation))
        [self setSelectedIndex:ISIOS7ANDABOVE()?1:0];
    else
        [self setSelectedIndex:ISIOS7ANDABOVE()?0:1];
}

#pragma mark - rotation method for iOS8
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self adaptToOrientation:size.width>size.height?UIInterfaceOrientationPortrait:UIInterfaceOrientationLandscapeLeft];

}

#pragma mark - rotation method for iOS7
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    [self adaptToOrientation:interfaceOrientation];
}

- (void) viewWillAppear:(BOOL)animated
{
    if (ISIOS7ANDABOVE())
        [self adaptToOrientation:INTERFACE_ORIENTATION()];
}

@end
