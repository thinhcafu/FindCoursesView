//
//  ContentTableViewCell.m
//  FindCoursesView
//
//  Created by ECEP2010 on 10/22/15.
//  Copyright © 2015 ECEP. All rights reserved.
//

#import "ContentTableViewCell.h"

@implementation ContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // init code
    }
    return  self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    float height;
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    UIWebView *webContent = (UIWebView *)[cell viewWithTag:4];
//    CGRect frame = webContent.frame;
//    height = frame.origin.y + frame.size.height + 30 ;
//    return height;
//}
@end
