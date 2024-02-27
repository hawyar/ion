#import "Global.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface Eval : NSObject
@property(nonatomic, strong) JSContext *context;
@property(nonatomic, strong) Global *global;

- (instancetype)init;
- (instancetype)initWithGlobalAndContext:(Global *)global
                                 context:(JSContext *)context;
- (void)setGlobal;
- (JSValue *)eval:(NSString *)expr;

@end