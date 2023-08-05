#import "Eval.h"
#import "Global.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Eval

- (instancetype)init {
  self = [super init];
  if (self) {
    self.global = [[Global alloc] init];
    self.context = [[JSContext alloc] init];
    [self setContextGlobal];
  }
  return self;
}

- (instancetype)initWithGlobalAndContext:(Global *)global
                                 context:(JSContext *)context {
  self = [super init];
  if (self) {
    self.global = global;
    self.context = context;
    [self setContextGlobal];
  }
  return self;
}

- (JSValue *)eval:(NSString *)expr {
  JSValue *result = [_context evaluateScript:expr];

  if ([_context.exception isObject]) {
    NSLog(@"JS error: %@", _context.exception);
  } else {
    NSLog(@"output: %@", [result toObject]);
  }

  return result;
}

- (void)setContextGlobal {
  self.context[self.global.key] = self.global;
  // self.context[@"patient"] =
}

// - (JSValue *)evalWithContext:(JSContext *)context expr:(NSString *)expr {
// NSLog(@"input: %@", expr);
// context[self.global.key] = self.global;
// }
@end