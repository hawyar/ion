#import "Reader.h"
#import "Repl.h"
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

void PrintUsage(NSString *name, NSString *version) {
  NSString *usage =
      @"\nUsage: %@ v%@ [options] [file or expression]\n"
      @"\t-h, --help: Print this help text\n"
      @"\t-v, --version: Print the version of the program\n"
      @"\t-e, --eval <expression>: Evaluate the expression\n"
      @"\t-f, --file <file>: Evaluate the file\n"
      @"\n"
      @"\tIf no options are provided, the program will open the REPL."
      @"\n"
      @"\tExample: %@ -e \"ion.version\"\n";

  NSString *doubleSpace = @"  ";

  NSString *usageWithDoubleSpaces =
      [usage stringByReplacingOccurrencesOfString:@"\t" withString:doubleSpace];
  NSLog(usageWithDoubleSpaces, name, version, name);
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

      // if ([arg isEqualToString:@"--demo"]) {
      // dispatch_queue_t queue = dispatch_queue_create("ion_queue",
      // DISPATCH_QUEUE_CONCURRENT); define the block which will get the number
      // and print it dispatch_async(queue, printBlock);
      // }
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