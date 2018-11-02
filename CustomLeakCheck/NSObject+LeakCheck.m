//
//  NSObject+LeakCheck.m
//  CustomLeakCheck
//
//  Created by Kinken_Yuen on 2018/11/2.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "NSObject+LeakCheck.h"
#import <objc/runtime.h>

@implementation NSObject (LeakCheck)
+ (void)swizzleMethod:(SEL)originSEL SwizzleSEL:(SEL)SwizzleSEL {
    Method originMethod = class_getInstanceMethod([self class], originSEL);
    Method swizzleMethod = class_getInstanceMethod([self class], SwizzleSEL);
    //防止自定义方法没有实现
    BOOL didAddMethod = class_addMethod([self class], originSEL, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod([self class], SwizzleSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
}

- (void)LeakCheck {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%@ will Leak!",strongSelf);
    });
}
@end
