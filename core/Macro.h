#ifndef Macro_h
#define Macro_h

#define DLog(format, ...) printf("%s", [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String])

#endif 
