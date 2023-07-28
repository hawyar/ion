#import "Eval.h"
#import <Foundation/Foundation.h>

@interface Repl : NSObject
@property(nonatomic, strong) Eval *eval;

- (instancetype)initWithEval:(Eval *)eval;
- (NSString *)getInput;
- (void)run;

@end