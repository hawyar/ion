#import "Global.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@implementation Global
- (instancetype)init {
  self = [super init];

  if (self) {
    _version = @"1.0.0";
  }

  return self;
}
- (id)patient:(NSString *)name {
  Patient *patient = [[Patient alloc] initWithName:name];
  return patient;
}
@end

@implementation Patient
- (instancetype)initWithName:(NSString *)name {
  self = [super init];

  if (self) {
    _name = name;
  }

  return self;
}

// implement the JSON function which returns a JSON string
// of the object like {"name" : "John Doe"}
- (NSString *)JSON {
  NSDictionary *dict = @{@"name" : _name};
  NSError *error;
  NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                 options:0
                                                   error:&error];

  if (error) {
    NSLog(@"Error: %@", error);
    return nil;
  }

  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end