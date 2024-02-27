#import "Reader.h"

@implementation Reader

- (NSString *)readFromFile:(NSString *)filename {
  NSError *error;

  NSString *content = [NSString stringWithContentsOfFile:filename
                                                encoding:NSUTF8StringEncoding
                                                   error:&error];

  if (error) {
    NSLog(@"Error reading file: %@", error.localizedDescription);
    return nil;
  } else {
    return content;
  }
}

- (NSString *)readFromExpression:(NSString *)expression {
  return expression;
}

@end