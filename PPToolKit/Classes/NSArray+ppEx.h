//
//  NSArray+ppEx.h
//  Ashton
//
//  Created by pengpeng on 2023/11/16.
//  Copyright © 2023 Falcon Automation. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray <__covariant ObjectType> (ppEx)

/// 返回数组指定下标的元素, 可以为空, 不会越界
- (nullable ObjectType)pp_objectNullableAtIndex:(NSUInteger)index;

/// 生成新的数组, 回调返回重新生成的符合要求的对象
- (NSArray *)pp_map:(id(^)(ObjectType element))block;
/// 生成新的数组, 回调 带下标 返回重新生成的符合要求的对象
- (NSArray *)pp_mapWithIndex:(id(^)(ObjectType element, NSInteger index))block;

/// 过滤符合条件的元素, 生成新的数组
- (NSArray <ObjectType>*)pp_filter:(BOOL(^)(ObjectType element))block;

/// 判断是否包含满足条件的元素
- (BOOL)pp_contains:(BOOL(^)(ObjectType element))block;

/// 找到第一个符合条件的元素, 可以为空
- (nullable ObjectType)pp_first:(BOOL(^)(ObjectType element))block;
/// 符合条件的元素的下标, 如果不存在, 则返回-1
- (NSInteger)pp_firstIndex:(BOOL(^)(ObjectType element))block;

@end

@interface NSMutableArray <ObjectType> (ppEx)

/// 可变数组移除符合条件的元素
- (void)pp_remove:(BOOL(^)(ObjectType element))block;

@end

NS_ASSUME_NONNULL_END
