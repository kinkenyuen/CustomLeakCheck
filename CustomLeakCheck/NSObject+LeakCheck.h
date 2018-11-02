//
//  NSObject+LeakCheck.h
//  CustomLeakCheck
//
//  Created by Kinken_Yuen on 2018/11/2.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LeakCheck)
/**
 用于交换方法实现

 @param originSEL 系统SEL
 @param SwizzleSEL 自定义SEL
 */
+ (void)swizzleMethod:(SEL)originSEL SwizzleSEL:(SEL)SwizzleSEL;

/**
 延迟捕获对象，检查是否释放
 */
- (void)LeakCheck;

@end

NS_ASSUME_NONNULL_END
