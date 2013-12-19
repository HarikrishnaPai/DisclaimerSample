//
//  DisclaimerViewController.m
//  DisclaimerSample
//
//  Created by Hari on 19/12/13.
//  Copyright (c) 2013 GTL. All rights reserved.
//

#import "DisclaimerViewController.h"
#import "ViewController.h"

@interface DisclaimerViewController ()

@end

@implementation DisclaimerViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)disclaimerAccepted:(id)sender
{
    // change the value of disclaimerAccepted to YES, when user clicks the accept button
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"disclaimerAccepted"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    // load the default home page after accepting the disclaimer
    ViewController *vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
