#ifndef Macro_h
#define Macro_h

#define ANSI_COLOR_RED "\x1b[31m"
#define ANSI_COLOR_GREEN "\x1b[32m"
#define ANSI_COLOR_YELLOW "\x1b[33m"
#define ANSI_COLOR_BLUE "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN "\x1b[36m"
#define ANSI_COLOR_RESET "\x1b[0m"

#define DColorLog(color, format, ...)                                          \
  printf(color "%s" ANSI_COLOR_RESET,                                          \
         [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String])

#define DLog(format, ...)                                                      \
  printf("%s", [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String])

#endif
