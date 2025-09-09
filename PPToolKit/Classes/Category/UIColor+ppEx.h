//
//  UIColor+ppEx.h
//  PPToolKit
//
//  Created by ex_liuzp9 on 2025/9/9.
//

#import <UIKit/UIKit.h>

// Quickly create UIColor with 0-255 RGB and 0.0-1.0 alpha
#ifndef PPRgba
#define PPRgba(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#endif
#ifndef PPRgb
#define PPRgb(r, g, b) PPRgba((r), (g), (b), 1.0)
#endif
#ifndef PPHex
#define PPHex(hex) [UIColor pp_colorWithHex:(hex)]
#endif
#ifndef PPHexA
#define PPHexA(hex, a) [[UIColor pp_colorWithHex:(hex)] colorWithAlphaComponent:(a)]
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ppEx)

// Create color from hex value like 0xRRGGBB or 0xAARRGGBB
+ (UIColor *)pp_colorWithHex:(NSUInteger)hex;

// Create color from string like "#RRGGBB", "RRGGBB", "#AARRGGBB", "0xRRGGBB"
+ (UIColor *)pp_colorWithHexString:(NSString *)hexString;

// Dynamic color for light/dark mode with iOS 13+ fallback support
+ (UIColor *)pp_dynamicColorWithLight:(UIColor *)lightColor dark:(UIColor *)darkColor;

// Random color
+ (UIColor *)pp_randomColor;

@end

NS_ASSUME_NONNULL_END
