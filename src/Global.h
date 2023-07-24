#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GlobalExports <JSExport>
- (NSInteger)add:(NSInteger)a to:(NSInteger)b;
@end

@interface Global : NSObject <GlobalExports>
@end