#import "Repl.h"
#import "Eval.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Repl

- (void)run {
  NSLog(@"starting repl...");

  JSContext *context = [[JSContext alloc] init];
  Eval *evaluator = [[Eval alloc] initWithContext:context];

  while (1) {
    printf(">> ");
    NSString *input = [self getInput];

    if ([input isEqualToString:@"exit"]) {
      break;
    }

    NSLog(@"You entered: %@", input);

    [evaluator eval:input];

    // JSValue *result = [context evaluateScript:input];
    // if ([context.exception isObject]) {
    // NSLog(@"JavaScript Error: %@", context.exception);
    // } else {
    // NSLog(@"Result: %@", [result toObject]);
    // }
  }
}

- (NSString *)getInput {
  NSMutableString *input = [[NSMutableString alloc] init];

  while (1) {
    char c = getchar();

    if (c == '\n') {
      break;
    }

    [input appendFormat:@"%c", c];
  }

  return [input
      stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end