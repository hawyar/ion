#import "Buffer.h"

@implementation Buffer

- (instancetype)initWithLength:(NSUInteger)length fill:(int)fill {
  self = [super init];
  if (self) {
    self.buffer = [NSMutableData dataWithLength:length];
    memset(self.buffer.mutableBytes, fill, length);
  }
  return self;
}

+ (instancetype)alloc:(NSUInteger)length {
  return [[self alloc] initWithLength:length fill:0];
}

+ (instancetype)alloc:(NSUInteger)length fill:(id)fill {
  if ([fill isKindOfClass:[NSNumber class]]) {
    return [[self alloc] initWithLength:length fill:[fill intValue]];
  } else if ([fill isKindOfClass:[NSString class]]) {
    NSString *string = (NSString *)fill;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
      return [[self alloc] initWithData:data];
    } else {
      NSLog(@"Error converting string to data");
      return nil;
    }
  } else if ([fill isKindOfClass:[NSArray class]]) {
    NSArray *array = (NSArray *)fill;
    return [[self alloc] initWithArray:array];
  } else {
    NSLog(@"Unsupported fill type");
    return nil;
  }
}
@end

// #import "Buffer.h"

// @implementation Buffer

// + (instancetype)allocWithLength:(NSUInteger)length {
//   return [[self alloc] initWithLength:length fill:0];
// }

// + (instancetype)allocWithLengthAndFill:(NSUInteger)length fill:(int)fill {
//   return [[self alloc] initWithLength:length fill:fill];
// }

// + (instancetype)allocUnsafe:(NSUInteger)length {
//   return [[self alloc] initWithUnsafeLength:length];
// }

// + (instancetype)fromBytes:(NSArray<NSNumber *> *)bytes {
//   return [[self alloc] initWithBytes:bytes];
// }

// + (instancetype)fromString:(NSString *)string
//                   encoding:(NSStringEncoding)encoding {
//   return [[self alloc] initWithString:string encoding:encoding];
// }

// + (instancetype)fromArray:(NSArray<NSNumber *> *)array {
//   return [[self alloc] initWithArray:array];
// }

// - (instancetype)initWithArray:(NSArray<NSNumber *> *)array {
//   self = [super init];
//   if (self) {
//     NSUInteger length = array.count;
//     self.buffer = [NSMutableData dataWithLength:length];
//     uint8_t *mutableBytes = self.buffer.mutableBytes;
//     for (NSUInteger i = 0; i < length; i++) {
//       mutableBytes[i] = array[i].unsignedCharValue;
//     }
//   }
//   return self;
// }

// - (instancetype)initWithLength:(NSUInteger)length fill:(int)fill {
//   self = [super init];
//   if (self) {
//     self.buffer = [NSMutableData dataWithLength:length];
//     memset(self.buffer.mutableBytes, fill, length);
//   }
//   return self;
// }

// - (instancetype)initWithUnsafeLength:(NSUInteger)length {
//   self = [super init];
//   if (self) {
//     self.buffer = [NSMutableData dataWithLength:length];
//   }
//   return self;
// }

// - (instancetype)initWithBytes:(NSArray<NSNumber *> *)bytes {
//   self = [super init];
//   if (self) {
//     NSUInteger length = bytes.count;
//     self.buffer = [NSMutableData dataWithLength:length];
//     uint8_t *mutableBytes = self.buffer.mutableBytes;
//     for (NSUInteger i = 0; i < length; i++) {
//       mutableBytes[i] = bytes[i].unsignedCharValue;
//     }
//   }
//   return self;
// }

// - (instancetype)initWithString:(NSString *)string
//                       encoding:(NSStringEncoding)encoding {
//   self = [super init];
//   if (self) {
//     NSData *data = [string dataUsingEncoding:encoding];
//     if (data) {
//       self.buffer = [NSMutableData dataWithData:data];
//     } else {
//       NSLog(@"Error converting string to data");
//       return nil;
//     }
//   }
//   return self;
// }

// - (NSUInteger)length {
//   return self.buffer.length;
// }

// - (NSNumber *)get:(NSUInteger)index {
//   if (index >= self.buffer.length) {
//     NSLog(@"Index out of bounds");
//     return nil;
//   }
//   uint8_t byte;
//   [self.buffer getBytes:&byte range:NSMakeRange(index, 1)];
//   return @(byte);
// }

// - (void)set:(NSUInteger)index value:(NSNumber *)value {
//   if (index >= self.buffer.length) {
//     NSLog(@"Index out of bounds");
//     return;
//   }
//   uint8_t byte = [value unsignedCharValue];
//   [self.buffer replaceBytesInRange:NSMakeRange(index, 1) withBytes:&byte];
// }

// - (NSData *)bytes {
//   return self.buffer;
// }

// - (NSString *)toString {
//   return [[NSString alloc] initWithData:self.buffer
//                                encoding:NSUTF8StringEncoding];
// }

// @end
