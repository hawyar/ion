#import <Foundation/Foundation.h>

@interface Reader : NSObject

@property(nonatomic, strong) NSString *content;

- (NSString *)readFromFile:(NSString *)filename;
- (NSString *)readFromExpression:(NSString *)expression;

@end
