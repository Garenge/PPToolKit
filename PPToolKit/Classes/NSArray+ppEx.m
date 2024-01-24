//
//  NSArray+ppEx.m
//  Ashton
//
//  Created by pengpeng on 2023/11/16.
//  Copyright © 2023 Falcon Automation. All rights reserved.
//

#import "NSArray+ppEx.h"

@implementation NSArray (ppEx)

/// 点语法返回数组指定下标的元素, 可以为空, 不会越界
- (id _Nullable (^)(NSUInteger))objectNullableAtIndexBlock {
    return ^_Nullable id(NSUInteger index) {
        return [self pp_objectNullableAtIndex:index];
    };
}
/// 返回数组指定下标的元素, 可以为空, 不会越界
- (id)pp_objectNullableAtIndex:(NSUInteger)index {
    if (self.count > index) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

- (NSArray *)pp_map:(id  _Nonnull (^)(id _Nonnull))block {
    if (!block) { return @[]; }
    
    NSMutableArray *array = [NSMutableArray array];
    for (id object in self) {
        [array addObject:block(object)];
    }
    return array;
}

- (NSArray *)pp_mapWithIndex:(id  _Nonnull (^)(id _Nonnull, NSInteger))block {
    if (!block) { return @[]; }
    
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = self.count;
    for (NSInteger index = 0; index < count; index ++) {
        id object = [self objectAtIndex:index];
        [array addObject:block(object, index)];
    }
    return array;
}

- (NSArray *)pp_filter:(BOOL (^)(id _Nonnull))block {
    if (!block) { return @[]; }
    
    NSMutableArray *array = [NSMutableArray array];
    for (id object in self) {
        if (block(object)) {
            [array addObject:object];
        }
    }
    return array;
}

- (BOOL)pp_contains:(BOOL (^)(id _Nonnull))block {
    if (!block) { return NO; }
    
    for (id object in self) {
        if (block(object)) {
            return YES;
        }
    }
    return NO;
}

- (id)pp_first:(BOOL (^)(id _Nonnull))block {
    if (!block) { return nil; }
    
    for (id object in self) {
        if (block(object)) {
            return object;
        }
    }
    return nil;
}

- (NSInteger)pp_firstIndex:(BOOL (^)(id _Nonnull))block {
    if (!block) { return -1; }
    
    NSInteger count = self.count;
    for (NSInteger index = 0; index < count; index ++) {
        id object = [self objectAtIndex:index];
        if (block(object)) {
            return index;
        }
    }
    return -1;
}

@end

@implementation NSMutableArray (ppEx)

- (void)pp_remove:(BOOL (^)(id _Nonnull))block {
    if (!block) { return; }
    
    NSInteger count = self.count;
    
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    for (NSInteger index = 0; index < count; index ++) {
        id object = [self objectAtIndex:index];
        if (block(object)) {
            [indexSet addIndex:index];
        }
    }
    [self removeObjectsAtIndexes:indexSet];
}

@end
