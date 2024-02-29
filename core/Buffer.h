#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol BufferExports <JSExport>

@property(nonatomic, readonly) NSUInteger length;
- (instancetype)initWithLength:(NSUInteger)length fill:(int)fill;
+ (instancetype)alloc:(NSUInteger)length;
// support all this type of fills fill <string> | <Buffer> | <Uint8Array> |
+ (instancetype)alloc:(NSUInteger)length fill:(id)fill;
@end

@interface Buffer : NSObject <BufferExports>

@property(nonatomic, readonly) NSUInteger length;
@property(nonatomic, readwrite) NSMutableData *buffer;
- (instancetype)initWithLength:(NSUInteger)length fill:(int)fill;
+ (instancetype)alloc:(NSUInteger)length;
+ (instancetype)alloc:(NSUInteger)length fill:(id)fill;
@end
