//
//  LCResultViewControllerViewController.m
//  LoanCaculator
//
//  Created by lingyi xu on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LCResultViewController.h"

@interface LCResultViewController (Private)

- (void)backAction:(UIBarButtonItem *)button;

@end

@implementation LCResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = backButton;
    [backButton release];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    
    [self.view addSubview:_scrollView];
    [_scrollView release];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_scrollView addSubview:_tableView];
    [_tableView release];
    
    _caculatorModel = [LCCaculatorModel instance];
    
}

#pragma mark - UITableViewDelegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_caculatorModel.resultPerMonthRepay){
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0){
        return [_caculatorModel.resultTitle count];
    }else{
        return [_caculatorModel.resultPerMonthRepay count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if(indexPath.section==0){
        cell.textLabel.text = [_caculatorModel.resultTitle objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [_caculatorModel.resultPerMonthRepay objectAtIndex:indexPath.row];
    }
    
    return cell;
}
#pragma mark - Custom Methods
- (void)backAction:(UIBarButtonItem *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Memory management Methods
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)dealloc
{
    [super dealloc];
}

@end
