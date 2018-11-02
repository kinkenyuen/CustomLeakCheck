//
//  UIViewController+LeakCheck.m
//  CustomLeakCheck
//
//  Created by Kinken_Yuen on 2018/11/2.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

/**
 场景：检测视图控制器pop之后是否已释放
 */

#import "UIViewController+LeakCheck.h"
#import "NSObject+LeakCheck.h"
#import <objc/runtime.h>

const char *IS_POP = "isPop";

@implementation UIViewController (LeakCheck)
/**
 分类加载的时候交换UIViewController的ViewWillAppear方法与ViewDidDisapper方法
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(viewWillAppear:) SwizzleSEL:@selector(kk_viewWillAppear:)];
        [self swizzleMethod:@selector(viewDidDisappear:) SwizzleSEL:@selector(kk_viewDidDisappear:)];
    });
}

- (void)kk_viewWillAppear:(BOOL)animated {
    [self kk_viewWillAppear:animated];
    //当控制器push进来，用关联对象标记控制器状态
    objc_setAssociatedObject(self, IS_POP, @(NO), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)kk_viewDidDisappear:(BOOL)animated {
    [self kk_viewDidDisappear:animated];
    //检查控制器是否pop出
    if ([objc_getAssociatedObject(self, IS_POP) boolValue]) {
        [self LeakCheck];
    }
}

@end
