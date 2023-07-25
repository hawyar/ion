#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GlobalExports <JSExport>
- (id)patient:(NSString *)name;
- (NSString *)version;
@end

@interface Global : NSObject <GlobalExports>
@property(nonatomic, strong) NSString *version;
@end

@protocol PatientExports <JSExport>
@property(nonatomic, strong) NSString *name;
- (instancetype)initWithName:(NSString *)name;
- (NSString *)JSON;
@end

@interface Patient : NSObject <PatientExports>
@property(nonatomic, strong) NSString *name;
- (instancetype)initWithName:(NSString *)name;

- (NSString *)JSON;
@end
