#import "Macro.h"
#import "Eval.h"
#import "Global.h"
#import "Fetch.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Eval

- (instancetype)init {
  self = [super init];
  if (self) {
    self.global = [[Global alloc] init];
    self.context = [[JSContext alloc] init];
    [self setGlobal];
  }
  return self;
}

- (instancetype)initWithGlobalAndContext:(Global *)global
                                 context:(JSContext *)context {
  self = [super init];
  if (self) {
    self.global = global;
    self.context = context;
    [self setGlobal];
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

- (void)setGlobal {
  self.context[self.global.key] = self.global;
  self.context[@"fetch"] = [[Fetch alloc] init];
}

// -(void)setFetch {
//   __weak typeof(self) weakSelf = self;

//   self.context[@"fetch"] = ^void(NSString *url) {
//     [weakSelf fetchNext:url];
//   };
// }

// -(void) fetchNext:(NSString *) url {
//   NSLog(@"%@", url);
// }

-(void)logJSValue:(JSValue *)value {
    if (value.isUndefined) {
        NSLog(@"JS Value: Undefined");
    } else if (value.isNull) {
        NSLog(@"JS Value: Null");
    } else if (value.isNumber) {
        NSLog(@"JS Value (Number): %@", value.toNumber);
    } else if (value.isString) {
        NSLog(@"JS Value (String): %@", value.toString);
    } else if (value.isBoolean) {
        NSLog(@"JS Value (Boolean): %@", value.toBool ? @"true" : @"false");
    } else if (value.isObject) {
        id obj = [value toObject];
        NSLog(@"JS Value (Object): %@", obj);
    } else {
        JSValue *type = [self.context evaluateScript:[NSString stringWithFormat:@"typeof %@", value]];
        NSLog(@"JS Value (%@): %@", type, value);
    }
}


// - (JSValue *)evalWithContext:(JSContext *)context expr:(NSString *)expr {
// NSLog(@"input: %@", expr);
// context[self.global.key] = self.global;
// }
@end