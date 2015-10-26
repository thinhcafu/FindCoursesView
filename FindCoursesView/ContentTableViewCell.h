//
//  ContentTableViewCell.h
//  FindCoursesView
//
//  Created by ECEP2010 on 10/22/15.
//  Copyright © 2015 ECEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLogo;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@end
