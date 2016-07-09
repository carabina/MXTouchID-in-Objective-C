//
//  MXTouchID.m
//  Meniny
//
//  Created by Meniny on 15/8/8.
//  Copyright (c) 2015年 Meniny. All rights reserved.
//
//  Powerd by Meniny.
//  See http://www.meniny.cn/ for more informations.
//

#import "MXTouchID.h"

@import LocalAuthentication;

@implementation MXTouchID

#pragma mark - 判断指纹是否可用
+ (BOOL)touchIDEnabled {
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    BOOL success = [context canEvaluatePolicy: LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    if (success) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 验证指纹
+ (void)touchIDEvaluateWithMessage:(NSString *)message completed:(void (^)(BOOL success, NSString *msg,NSError *authenticationError))completion {
    [MXTouchID touchIDEvaluateWithMessage:message localizedFallbackTitle:@"" completed:completion];
}

+ (void)touchIDEvaluateWithMessage:(NSString *)message localizedFallbackTitle:(NSString *)localizedFallbackTitle completed:(void (^)(BOOL success, NSString *msg, NSError *authenticationError))completion {
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = localizedFallbackTitle;
    __block NSString *msg;
    
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:NSLocalizedString(message, nil) reply:
     ^(BOOL success, NSError *authenticationError) {
         if (success) {
             msg = NSLocalizedString(@"EVALUATE_POLICY_SUCCESS", nil);
         } else {
             msg = [NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_WITH_ERROR", nil), authenticationError.localizedDescription];
         }
         if (completion) {
             completion(success, msg, authenticationError);
         }
     }];
}

@end
