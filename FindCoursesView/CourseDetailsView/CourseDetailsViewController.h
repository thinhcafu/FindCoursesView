//
//  CourseDetailsViewController.h
//  FindCoursesView
//
//  Created by ECEP2010 on 10/22/15.
//  Copyright © 2015 ECEP. All rights reserved.
//

#import "ViewController.h"

@interface CourseDetailsViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)valueChangedSegment:(id)sender;

@property (nonatomic) UISegmentedControl* segmentedControl;

@end
