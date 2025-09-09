//
//  UIColor+ppEx.m
//  PPToolKit
//
//  Created by ex_liuzp9 on 2025/9/9.
//

#import "UIColor+ppEx.h"

@implementation UIColor (ppEx)

+ (UIColor *)pp_colorWithHex:(NSUInteger)hex {
    CGFloat alpha = 1.0;
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;

    if (hex <= 0xFFFFFF) {
        red = ((hex & 0xFF0000) >> 16) / 255.0;
        green = ((hex & 0x00FF00) >> 8) / 255.0;
        blue = (hex & 0x0000FF) / 255.0;
    } else {
        alpha = ((hex & 0xFF000000) >> 24) / 255.0;
        red = ((hex & 0x00FF0000) >> 16) / 255.0;
        green = ((hex & 0x0000FF00) >> 8) / 255.0;
        blue = (hex & 0x000000FF) / 255.0;
    }

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)pp_colorWithHexString:(NSString *)hexString {
    NSString *string = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([string hasPrefix:@"#"]) {
        string = [string substringFromIndex:1];
    } else if ([string hasPrefix:@"0X"]) {
        string = [string substringFromIndex:2];
    }

    NSUInteger hex = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    if (![scanner scanHexInt:(unsigned int *)&hex]) {
        return [UIColor clearColor];
    }

    if (string.length == 6) {
        return [self pp_colorWithHex:hex];
    } else if (string.length == 8) {
        return [self pp_colorWithHex:hex];
    } else {
        return [UIColor clearColor];
    }
}

+ (UIColor *)pp_dynamicColorWithLight:(UIColor *)lightColor dark:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? darkColor : lightColor;
        }];
    }
    return lightColor;
}

+ (UIColor *)pp_randomColor {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
