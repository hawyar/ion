#import "Eval.h"
#import "Macro.h"
#import "Reader.h"
#import "Repl.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

void PrintUsage(NSString *name, NSString *version) {
  NSString *usage =
      @"Usage: %@ v%@ [options] [file or expression]\n"
      @"-h, --help: Print this help text\n"
      @"-v, --version: Print the version of the program\n"
      @"-e, --eval <expression>: Evaluate the expression\n"
      @"-f, --file <file>: Evaluate the file\n"
      @"If no options are provided, the program will open the REPL.\n";
  DLog(usage, name, version, name);
}

int main(int argc, const char *argv[]) {
  NSString *version = @"0.0.1";
  NSString *name = @"ion";

  @autoreleasepool {
    if (argc < 2) {
      REPL *repl = [[REPL alloc] init];

      [repl run];
      return 0;
    }
    for (int i = 0; i < argc; i++) {
      NSString *arg = [NSString stringWithUTF8String:argv[i]];

      if ([arg isEqualToString:@"-h"] || [arg isEqualToString:@"--help"]) {
        PrintUsage(name, version);
        break;
      }

      if ([arg isEqualToString:@"-v"] || [arg isEqualToString:@"--version"]) {
        NSLog(@"%@ v%@", name, version);
        break;
      }

      if ([arg isEqualToString:@"-e"] || [arg isEqualToString:@"--eval"]) {
        if (argc < 3) {
          PrintUsage(name, version);
          break;
        }

        NSString *input = [NSString stringWithUTF8String:argv[i + 1]];

        if ([input isEqualToString:@""]) {
          PrintUsage(name, version);
          break;
        }

        Eval *evaluator = [[Eval alloc] init];

        [evaluator eval:input];
        break;
      }

      if ([arg isEqualToString:@"-f"] || [arg isEqualToString:@"--file"]) {
        if (argc < 3) {
          PrintUsage(name, version);
          break;
        }

        NSString *path = [NSString stringWithUTF8String:argv[i + 1]];

        if ([path isEqualToString:@""]) {
          PrintUsage(name, version);
          break;
        }

        Reader *reader = [[Reader alloc] init];

        NSString *input = [reader readFromFile:path];

        Eval *evaluator = [[Eval alloc] init];

        [evaluator eval:input];

        break;
      }
    }
  }
}