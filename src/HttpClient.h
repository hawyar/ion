#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol HttpClientExport <JSExport>
- (NSString *)get:(NSString *)url;
@end

@interface HttpClient : NSObject <HttpClientExport>
- (NSString *)get:(NSString *)url;
@end
