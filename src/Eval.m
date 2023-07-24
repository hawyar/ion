#import "Reader.h"
#import "Repl.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

void PrintUsage() {
  NSString *usage = @"Usage %@ <file or expression>";
  NSLog(@"%@", usage);
}

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    if (argc < 2) {
      Repl *repl = [[Repl alloc] init];

      [repl run];
      return 0;
    }

    NSString *expr = [NSString stringWithUTF8String:argv[1]];

    if ([expr isEqualToString:@""]) {
      PrintUsage();
      return 1;
    }

    Reader *reader = [[Reader alloc] init];

    if ([expr hasPrefix:@"/"] || [expr hasPrefix:@"./"] ||
        [expr hasPrefix:@"../"] || [expr hasPrefix:@"~"]) {
      expr = [reader readFromFile:expr];
    } else {
      expr = [reader readFromExpression:expr];
    }

    NSLog(@"content: %@", expr);

    // JSContext *context = [[JSContext alloc] init];

    // JSValue *result = [context evaluateScript:expr];

    // if ([context.exception isObject]) {
    //   NSLog(@"JavaScript Error: %@", context.exception);
    // } else {
    //   NSLog(@"Result: %@", [result toObject]);
    // }
  }
  return 0;
}
