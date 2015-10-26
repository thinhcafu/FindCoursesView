//
//  TableViewController.h
//  FindCoursesView
//
//  Created by ECEP2010 on 10/22/15.
//  Copyright © 2015 ECEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)valueChangedSegment:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


@end
