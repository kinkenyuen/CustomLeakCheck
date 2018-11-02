//
//  KKViewController.m
//  CustomLeakCheck
//
//  Created by Kinken_Yuen on 2018/11/2.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "KKViewController.h"

@interface KKViewController ()
@property(nonatomic,copy) void(^block)(void);
@property(nonatomic,copy) NSString *str;

@end

@implementation KKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.str = @"Kinken_Yuen";
    self.block = ^(){
        NSLog(@"%@",self.str);
    };
    self.block();
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
