#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GlobalExports <JSExport>
@property(nonatomic, strong) NSString *version;
@property(nonatomic, strong) NSString *globalKey;
@end

@interface Global : NSObject <GlobalExports>
@end

// @protocol PatientExports <JSExport>
// @property(nonatomic, strong) NSString *name;
// - (instancetype)initWithName:(NSString *)name;
// - (NSString *)JSON;
// @end

// @interface Patient : NSObject <PatientExports>
// @property(nonatomic, strong) NSString *name;
// - (instancetype)initWithName:(NSString *)name;

// - (NSString *)JSON;
// @end
