//
//  MXTouchID.h
//  Meniny
//
//  Created by Meniny on 15/8/8.
//  Copyright (c) 2015年 Meniny. All rights reserved.
//
//  Powerd by Meniny.
//  See http://www.meniny.cn/ for more informations.
//

#import <Foundation/Foundation.h>

@interface MXTouchID : NSObject
+ (BOOL)touchIDEnabled;
+ (void)touchIDEvaluateWithMessage:(NSString *)message completed:(void (^)(BOOL success, NSString *msg,NSError *authenticationError))completion;
+ (void)touchIDEvaluateWithMessage:(NSString *)message localizedFallbackTitle:(NSString *)localizedFallbackTitle completed:(void (^)(BOOL success, NSString *msg,NSError *authenticationError))completion;
@end
