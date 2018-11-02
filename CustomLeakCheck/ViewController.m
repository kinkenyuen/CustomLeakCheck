//
//  ViewController.m
//  CustomLeakCheck
//
//  Created by Kinken_Yuen on 2018/11/2.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "ViewController.h"
#import "KKViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)push:(id)sender {
    KKViewController *vc = [[KKViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
