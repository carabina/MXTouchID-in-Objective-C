# MXTouchID-in-Objective-C

`MXTouchID` is an easy-to-use class for Touch ID on iOS.

## Installation with CocoaPods

```
pod 'MXTouchID'
```

## Usage

```
if ([MXTouchID touchIDEnabled]) {
  [MXTouchID touchIDEvaluateWithMessage:@"This is a message" completed:^(BOOL success, NSString *msg, NSError *authenticationError) {
    // code here...
  }];
}
```
