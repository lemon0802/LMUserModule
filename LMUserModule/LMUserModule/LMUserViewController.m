//
//  LMUserViewController.m
//  LMUserModule
//
//  Created by KADFWJ on 2018/3/7.
//  Copyright © 2018年 KAD. All rights reserved.
//

#import "LMUserViewController.h"
#import <LMUserServeice/LMUserServiceProtocol.h>
#import <BeeHive/BeeHive.h>

@interface LMUserViewController ()<LMUserServiceProtocol>

@property (nonatomic ,strong) UILabel *nameLB;

@end

@implementation LMUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人用户";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUserData:) name:@"UserNotification" object:nil];
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void) updateUserData:(NSNotification *)noti{
    
    self.nameLB.text = noti.object[@"name"];
    
}

-(UILabel *)nameLB{
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
        [self.view addSubview:_nameLB];
    }
    return _nameLB;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userData:(NSDictionary *)data{
    self.nameLB.text = data[@"name"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
