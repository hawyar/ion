#import "Eval.h"
#import "Global.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Eval

- (instancetype)initWithGlobalContext:(Global *)global
                              context:(JSContext *)context {
  self = [super init];
  if (self) {
    _global = global;
    _context = context;
  }
  return self;
}

- (JSValue *)eval:(NSString *)expr {

  NSLog(@"input: %@", expr);

  _context[@"fhir"] = _global;
  JSValue *result = [_context evaluateScript:expr];

  if ([_context.exception isObject]) {
    NSLog(@"JS error: %@", _context.exception);
  } else {
    NSLog(@"output: %@", [result toObject]);
  }

  return result;
}
@end