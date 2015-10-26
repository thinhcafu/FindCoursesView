//
//  TableViewController.m
//  FindCoursesView
//
//  Created by ECEP2010 on 10/22/15.
//  Copyright © 2015 ECEP. All rights reserved.
//

#import "TableViewController.h"

typedef enum
{
    TableSection_Main,
    TableSection_Overview,
    TableSection_Detail,
    TableSection_Schedule
} TableSection;

typedef enum {
    
    MainCell_One
} MainCell;

typedef enum {
    
    OverviewCell_One,
    OverviewCell_Two
} OverviewCell;

typedef enum {
    DetailCell_One
} DetailCell;

typedef enum {
    
    ScheduleCell_One,
    ScheduleCell_Two
} ScheduleCell;

typedef enum {
    
    SegmentIndex_Overview,
    SegmentIndex_Details,
    SegmentIndex_Schedule
}SegmentIndex;

@interface TableViewController ()
{
    
    CGFloat heightOfWebview;
    
    CGFloat heightOfWebViewDetail;
    
    NSString *globalStrWebView;
    
    BOOL isWebviewLoading;
    
    BOOL isWeviewBLoading;
    
    UIWebView *wvA;
    
    UIWebView *wvB;
}
@end

@implementation TableViewController

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
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.segmentControl.selectedSegmentIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if (webView == wvA) {
        heightOfWebview = webView.scrollView.contentSize.height;
        [self.tableView reloadData];
    }
    if (webView == wvB){
         NSString *output = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];
        heightOfWebViewDetail = [output floatValue];
        //heightOfWebViewDetail = webView.scrollView.contentSize.height;
        [self.tableView reloadData];
    }
    
    
    
    
    NSLog(@"web view did finish load: %f", heightOfWebview);
    NSLog(@"web view did finish load: %f", heightOfWebViewDetail);
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
        {
            if (section == 0) {
                return 1;
            }else if (section == 1)
            {
                
                return 2;
            }else if (section == 2)
            {
                
                return 0;
            }
            else if (section == 3){
                
                return 0;
            }
            
            
            break;
        }
        case 1:{
            
            if (section == 0) {
                return 1;
            }else if (section == 1)
            {
                
                return 0;
            }else if (section == 2)
            {
                
                return 1;
            }
            else if (section == 3){
                
                return 0;
            }
            
            break;
        }
        case 2:{
            
            if (section == 0) {
                return 1;
            }else if (section == 1)
            {
                
                return 0;
            }else if (section == 2)
            {
                
                return 0;
            }
            else if (section == 3){
                
                return 2;
            }
            
            break;
        }
        default:
            break;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    switch (self.segmentControl.selectedSegmentIndex) {
        case SegmentIndex_Overview:
        {
            switch (indexPath.section) {
                    
                case TableSection_Main:
                    break;
                case TableSection_Overview:
                {
                    
                    if (indexPath.row == 0) {
                        
                        NSString *strWeb = @"<h2 style='color:red;'>PSYC 110: Introduction to Psychology </h2><p>What do your dreams mean?</p><p> Do men and women differ in the nature and intensity of their sexual desires? Can apes learn sign language? Why can’t we tickle ourselves? This course tries to answer these questions and many others, providing a comprehensive overview of the scientific study of thought and behavior. It explores topics such as perception, communication, learning, memory, decision-making, religion, persuasion, love, lust, hunger, art, fiction, and dreams. We will look at how these aspects of the mind develop in children, how they differ across people, how they are wired-up in the brain, and how they break down due to illness and injury.</p> <h2 style='color:red;'>PSYC 110: Introduction to Psychology ";
                        
                        wvA = (UIWebView *)[cell viewWithTag:4];
                        wvA.scrollView.scrollEnabled = NO;
                        if (isWebviewLoading == FALSE) {
                            [wvA loadHTMLString:strWeb baseURL:nil];
                            wvA.delegate = self;
                            
                            isWebviewLoading = TRUE;
                        }
                        
                        
                        
                        CGSize contentSize = wvA.scrollView.contentSize;
                        NSLog(@"content size 1: %@", NSStringFromCGSize(contentSize));
                        NSString *output = [wvA stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];
                        NSLog(@"height: %@", output);
                        NSLog(@"height of web view %f",wvA.scrollView.contentSize.height);
                        
                    }
                    else if (indexPath.row == 1){
                        cell.imageView.image = [UIImage imageNamed:@"image1.jpg"];
                        //cell.imageView.layer.borderWidth = 5;
                        cell.imageView.layer.cornerRadius = 15.0;
                        cell.imageView.layer.masksToBounds = YES;
                        cell.textLabel.text = @"Thinh Phan";
                        cell.detailTextLabel.numberOfLines = 2;
                        
                        NSString *strDetail = [[@"NTU Information Technology" stringByAppendingString:@"\n"] stringByAppendingString:@"Working at ECEP group."];
                        NSLog(@"detail: %@",strDetail);
                        cell.detailTextLabel.text = strDetail;
                    }
                    break;
                }
                case TableSection_Detail:{
                    
                    
                    
                    break;
                }
                case TableSection_Schedule:{
                    
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case SegmentIndex_Details:{
            
            switch (indexPath.section) {
                    
                case TableSection_Main:
                {
                    break;
                }
                case TableSection_Overview:{
                    
                    break;
                }
                case TableSection_Detail:
                {
                    if (indexPath.row == 0) {
                        // cell.textLabel.text = @"thinh phan";
                        
                        NSString *strWeb = @"<h2 style='color:orange;'>CHEM 125b: Freshman Organic Chemistry II </h2> <p>This is a continuation of Freshman Organic Chemistry I (CHEM 125a), the introductory course on current theories of structure and mechanism in organic chemistry for students with excellent preparation in chemistry and physics. This semester treats simple and complex reaction mechanisms, spectroscopy, organic synthesis, and some molecules of nature.</p><h2 style='color:orange;'>CHEM 125b: Freshman Organic Chemistry II </h2> <p>This is a continuation of Freshman Organic Chemistry I (CHEM 125a), the introductory course on current theories of structure and mechanism in organic chemistry for students with excellent preparation in chemistry and physics. This semester treats simple and complex reaction mechanisms, spectroscopy, organic synthesis, and some molecules of nature.</p><h2 style='color:orange;'>CHEM 125b: Freshman Organic Chemistry II </h2> <p>This is a continuation of Freshman Organic Chemistry I (CHEM 125a), the introductory course on current theories of structure and mechanism in organic chemistry for students with excellent preparation in chemistry and physics. This semester treats simple and complex reaction mechanisms, spectroscopy, organic synthesis, and some molecules of nature.</p>";
                        
                        wvB = (UIWebView *)[cell viewWithTag:5];
                        
                        wvB.scrollView.scrollEnabled = NO;
                        
                        if (isWeviewBLoading == FALSE) {
                            
                            [wvB loadHTMLString:strWeb baseURL:nil];
                            
                            wvB.delegate = self;
                            
                            isWeviewBLoading = TRUE;
                        }
                        
                        
                        
                        CGSize contentSize = wvB.scrollView.contentSize;
                        NSLog(@"content size 1: %@", NSStringFromCGSize(contentSize));
                        NSString *output = [wvB stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];
                        NSLog(@"height: %@", output);
                        NSLog(@"height of web view %f",wvB.scrollView.contentSize.height);
                        
                        
                    }
                    
                    break;
                }
                case TableSection_Schedule:
                {
                    
                    break;
                }
                default:
                    break;
            }
        }
        case SegmentIndex_Schedule:
        {
            
            switch (indexPath.section) {
                    
                case TableSection_Main:
                    break;
                case TableSection_Overview:{
                    break;
                }
                case TableSection_Detail:
                {
                    break;
                }
                case TableSection_Schedule:
                {
                    if (indexPath.row == 0) {
                        cell.textLabel.text = @"Start: ";
                        
                    }
                    else if (indexPath.row == 1){
                        
                        cell.textLabel.text = @"End: ";
                    }
                    
                    break;
                }
                default:
                    break;
            }
            break;
        }
            
        default:
            break;
    }
    
    
    return cell;
}

- (IBAction)valueChangedSegment:(id)sender{
    
    [self.tableView reloadData];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                return 274.0f;
            }
            else{
                
                //----
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                NSLog(@"height for row: %f",heightOfWebview);
                
                return heightOfWebview;
            }
            if(indexPath.row == 1){
                return  70.0f;
            }
            break;
        case 2:
            if (indexPath.row == 0)
            {
                
                return heightOfWebViewDetail ;
            }
            break;
        case 3:
            if (indexPath.row == 0)
            {
                
                return 30.0f;
            }else if (indexPath.row == 1){
                
                return 30.0f;
            }
            break;
        default:
            break;
    }
    return 274.0f;
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
