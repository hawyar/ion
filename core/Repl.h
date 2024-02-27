#import "Eval.h"

@interface REPL : NSObject

@property(nonatomic, strong) Eval *eval;
@property(nonatomic, strong) NSString *prefixChar;
@property(nonatomic, strong) NSString *helpText;

- (instancetype)initWithEval:(Eval *)eval;
- (NSString *)currentBuffer;
- (void)run;

@end
