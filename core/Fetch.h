#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol FetchExport <JSExport>
- (instancetype)initWithURL:(NSString *)url;
@end

@interface Fetch : NSObject <FetchExport>
// - (instancetype)initWithURL:(NSString *)url;
@end
