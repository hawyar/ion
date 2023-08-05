#import "HttpClient.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GlobalExports <JSExport>
@property(nonatomic, strong) NSString *version;
@property(nonatomic, strong) NSString *key;
@property(nonatomic, strong) HttpClient *httpClient;
@end

@interface Global : NSObject <GlobalExports>
@end
