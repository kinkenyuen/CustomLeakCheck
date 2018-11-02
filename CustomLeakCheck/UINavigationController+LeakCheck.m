//
//  UINavigationController+LeakCheck.m
//  CustomLeakCheck
//
//  Created by Kinken_Yuen on 2018/11/2.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "UINavigationController+LeakCheck.h"
#import <objc/runtime.h>
#import "NSObject+LeakCheck.h"

@implementation UINavigationController (LeakCheck)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(popViewControllerAnimated:) SwizzleSEL:@selector(kk_popViewControllerAnimated:)];
    });
}

- (UIViewController *)kk_popViewControllerAnimated:(BOOL)animated {
    UIViewController *viewController = [self kk_popViewControllerAnimated:animated];
    //通过关联对象设置VC的pop状态
    extern const char *IS_POP;
    objc_setAssociatedObject(viewController, IS_POP, @(YES), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return viewController;
}
@end
