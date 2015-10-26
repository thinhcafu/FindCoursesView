//
//  CourseDetailsViewController.m
//  FindCoursesView
//
//  Created by ECEP2010 on 10/22/15.
//  Copyright © 2015 ECEP. All rights reserved.
//

#import "CourseDetailsViewController.h"
typedef enum
{
    TableSection_A,
    TableSection_B,
    TableSection_C
} TableSection;


@interface CourseDetailsViewController ()

@end

@implementation CourseDetailsViewController

- (void)loadView{

    [super loadView];
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 50.0f, 50.0f)];
    [backButton setImage:[UIImage imageNamed:@"Left-Filled-50.png"]  forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(void) popVC {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChangedSegment:(id)sender {
}



@end

