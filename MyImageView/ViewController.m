//
//  ViewController.m
//  MyImageView
//
//  Created by liqunfei on 15/8/18.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+MyImageView.h"
#import "MyTableViewCell.h"
@interface ViewController ()
{
    NSArray *imageUrls;
}
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end

@implementation ViewController
- (IBAction)beginDownloading:(id)sender {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"TestData" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    imageUrls = [dic objectForKey:@"item0"];
    [_myTable reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return imageUrls.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    NSURL *url = [NSURL URLWithString:@"http://pic.qiantucdn.com/10/77/73/39bOOOPICf9.jpg"];
    
    [cell.headImage webImageWithURL:url placeHolderImage:[UIImage imageNamed:@"placr.jpg"] downloadFlag:indexPath.row];
    [cell.headImage setTag:indexPath.row];
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
