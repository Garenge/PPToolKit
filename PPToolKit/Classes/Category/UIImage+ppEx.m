//
//  UIImage+ppEx.m
//  PPToolKit
//
//  Created by Garenge on 2025/8/9.
//

#import "UIImage+ppEx.h"

UIImage * UIImageMake(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}
UIImage * UIImageMakeSystem(NSString *imageName) {
    return [UIImage systemImageNamed:imageName];
}

@implementation UIImage (ppEx)

@end
