#import "Repl.h"

@implementation Repl

- (void)run {
  NSLog(@"started jsc repl");

  while (1) {
    NSString *input = [self getInput];

    if ([input isEqualToString:@"exit"]) {
      break;
    }

    NSLog(@"You entered: %@", input);
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