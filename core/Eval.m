#import "Eval.h"
#import "Buffer.h"
#import "Macro.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Eval

- (instancetype)init {
  self = [super init];
  if (self) {
    self.context = [[JSContext alloc] init];
    self.context[@"Buffer"] = [Buffer class];
  }
  return self;
}

- (JSValue *)eval:(NSString *)expr {
  JSValue *output = [_context evaluateScript:expr];

  if ([_context.exception isObject]) {
    DLog(@"%@\n", _context.exception);
  } else {
    [self logJSValue:output];
  }

  return output;
}

- (void)logJSValue:(JSValue *)value {
  if (value.isUndefined) {
    NSLog(@"JS Value: Undefined");
  } else if (value.isNull) {
    NSLog(@"JS Value: Null");
  } else if (value.isNumber) {
    // NSLog(@"JS Value (Number): %@", value.toNumber);
    DColorLog(ANSI_COLOR_GREEN, @"JS Value (Number): %@\n", value.toNumber);
  } else if (value.isString) {
    NSLog(@"JS Value (String): %@", value.toString);
  } else if (value.isBoolean) {
    NSLog(@"JS Value (Boolean): %@", value.toBool ? @"true" : @"false");
  } else if (value.isObject) {
    id obj = [value toObject];
    NSLog(@"JS Value (Object): %@", obj);
  } else {
    JSValue *type = [self.context
        evaluateScript:[NSString stringWithFormat:@"typeof %@", value]];
    NSLog(@"JS Value (%@): %@", type, value);
  }
}

@end
