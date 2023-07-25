#import "Eval.h"
#import "Global.h"
#import "Reader.h"
#import "Repl.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

void PrintUsage() {
  NSString *usage = @"Usage %@ <file or expression>";
  NSLog(@"%@", usage);
}

@implementation Eval {
  JSContext *_context;
}

- (instancetype)initWithContext:(JSContext *)context {
  self = [super init];

  if (self) {
    _context = context;
  }

  return self;
}

- (JSValue *)eval:(NSString *)expr {
  JSValue *result = [_context evaluateScript:expr];

  if ([_context.exception isObject]) {
    NSLog(@"JavaScript Error: %@", _context.exception);
  } else {
    NSLog(@"Result: %@", [result toObject]);
  }

  return result;
}
@end

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    if (argc < 2) {
      Repl *repl = [[Repl alloc] init];

      [repl run];
      return 0;
    }

    NSString *input = [NSString stringWithUTF8String:argv[1]];

    if ([input isEqualToString:@""]) {
      PrintUsage();
      return 1;
    }

    NSLog(@"input: %@", input);

    Reader *reader = [[Reader alloc] init];

    if ([input hasPrefix:@"/"] || [input hasPrefix:@"./"] ||
        [input hasPrefix:@"../"] || [input hasPrefix:@"~"]) {
      input = [reader readFromFile:input];
    } else {
      input = [reader readFromExpression:input];
    }

    JSContext *context = [[JSContext alloc] init];

    Global *global = [[Global alloc] init];

    context[@"fhir"] = global;

    // context[@"fhir"] = ^NSString *(NSString *resource) { return resource;
    // };

    Eval *evaluator = [[Eval alloc] initWithContext:context];

    [evaluator eval:input];
    return 0;
  }
  return 0;
}
