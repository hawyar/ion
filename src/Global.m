#import "Global.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Global
@synthesize version = _version;
@synthesize globalKey = _globalKey;
- (instancetype)init {
  self = [super init];

  if (self) {
    _version = @"1.0.0";
    _globalKey = @"fhir";
  }
  return self;
}
@end

// @implementation Patient
// - (instancetype)initWithName:(NSString *)name {
//   self = [super init];

//   if (self) {
//     _name = name;
//   }

//   return self;
// }

// - (NSString *)JSON {
//   NSDictionary *dict = @{@"name" : _name};
//   NSError *error;
//   NSData *data = [NSJSONSerialization dataWithJSONObject:dict
//                                                  options:0
//                                                    error:&error];

//   if (error) {
//     NSLog(@"Error: %@", error);
//     return nil;
//   }

//   return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
// }
// @end