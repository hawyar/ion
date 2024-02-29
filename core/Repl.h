#import "Eval.h"

#define bufferSize 1024

@interface REPL : NSObject

@property(nonatomic, strong) Eval *eval;
@property(nonatomic, strong) NSString *prefixChar;
@property(nonatomic, strong) NSString *helpText;

- (instancetype)initWithEval:(Eval *)eval;
- (NSString *)readLine;
- (void)run;

@end
