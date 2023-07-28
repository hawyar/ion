#import "Repl.h"
#import "Eval.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Repl

- (instancetype)initWithEval:(Eval *)eval {
  self = [super init];

  if (self) {
    self.eval = eval;
  }

  return self;
}

- (void)run {
  NSLog(@"starting repl...");

  JSContext *context = [[JSContext alloc] init];

  Global *global = [[Global alloc] init];

  context[@"fhir"] = global;

  Eval *evaluator = [[Eval alloc] initWithGlobalContext:global context:context];

  while (1) {
    printf(">> ");
    NSString *input = [self getInput];

    if ([input isEqualToString:@".exit"] || [input isEqualToString:@".quit"]) {
      break;
    }

    NSLog(@"You entered: %@", input);

    [evaluator eval:input];
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