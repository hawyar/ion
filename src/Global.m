#import "Global.h"
#import "HttpClient.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Global
@synthesize version;
@synthesize key;
@synthesize httpClient;
- (instancetype)init {
  self = [super init];

  if (self) {
    self.version = @"1.0.0";
    self.key = @"ion";
    self.httpClient = [[HttpClient alloc] init];
  }
  return self;
}
@end
