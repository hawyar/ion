#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface Eval : NSObject
@property(nonatomic, strong) JSContext *context;
- (JSValue *)eval:(NSString *)expr;

@end
