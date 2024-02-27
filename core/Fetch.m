#import <Foundation/Foundation.h>
#import "Fetch.h"

@implementation Fetch

- (instancetype)initWithURL:(NSString *)url {
  self = [super init];
  if (self) {
    NSLog(@"init with %@", url);
  }
  return self;
}

@end