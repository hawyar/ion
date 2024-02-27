#import "Global.h"
#import "Fetch.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Global
@synthesize version;
@synthesize key;
// @synthesize fetch;
- (instancetype)init {
  self = [super init];

  if (self) {
    self.version = @"1.0.0";
    self.key = @"ion";
    // self.fetch = [[Fetch alloc] init];
  }
  return self;
}
@end
