#import "Repl.h"
#import "Eval.h"
#import "Macro.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation REPL

- (instancetype)init {
  return [self initWithEval:[[Eval alloc] init]];
}

- (instancetype)initWithEval:(Eval *)eval {
  self = [super init];

  if (self) {
    _eval = eval;
    _prefixChar = @"> ";
    _helpText = @"Help text from ion v1.0\n"
                @"Type \".exit\" or press Ctrl-D to exit\n"
                @"Type \".help\" for help\n";
  }

  return self;
}

- (void)run {
  DLog(@"Welcome to ion v1.0 REPL\n");
  DLog(@"Type \".exit\" or press Ctrl-D to exit\n");

  Eval *evaluator = [[Eval alloc] init];

  while (1) {
    DLog(@"%@", _prefixChar);

    NSString *input = [self currentBuffer];

    if ([input isEqualToString:@".exit"]) {
      break;
    }

    if ([input isEqualToString:@".help"]) {
      DLog(@"%@\n", _helpText);
      continue;
    }

    DLog(@"input: %@\n", input);

    [evaluator eval:input];
  }
}

- (NSString *)currentBuffer {
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
