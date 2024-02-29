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

    NSString *line = [self readLine];

    if ([line isEqualToString:@".exit"]) {
      break;
    }

    if ([line isEqualToString:@".help"]) {
      DLog(@"%@\n", _helpText);
      continue;
    }

    // DLog(@"input: %@\n", line);
    // JSValue *result = [evaluator eval:line];
    [evaluator eval:line];
  }
}

- (NSString *)readLine {
  char buffer[bufferSize];
  fgets(buffer, bufferSize, stdin);

  NSString *input = [NSString stringWithUTF8String:buffer];

  NSAssert([input length] <= bufferSize,
           @"input is larger than buffer size of %d\n", bufferSize);

  return [input
      stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}
@end
