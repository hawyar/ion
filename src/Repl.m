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

  Eval *evaluator = [[Eval alloc] init];

  while (1) {
    printf(">> ");
    NSString *input = [self getInput];

    if ([input isEqualToString:@".exit"] || [input isEqualToString:@".quit"]) {
      break;
    }

    NSLog(@"input: %@", input);

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