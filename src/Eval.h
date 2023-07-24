#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface Eval : NSObject

@property(nonatomic, strong) JSContext *context;
@property(nonatomic, strong) JSValue *result;

- (instancetype)initWithContext:(JSContext *)context;
- (JSValue *)eval:(NSString *)expr;

@end