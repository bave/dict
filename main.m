#import <Cocoa/Cocoa.h>
#import <CoreServices/CoreServices.h>
//#include <DictionaryServices.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void usage(void)
{
    printf("dict [lookup_word]\n");
    exit(1);
}

int main(int argc, char** argv)
{

    if (argc != 2) usage();

    id pool = [NSAutoreleasePool new]; 
    //if (argc != 2 ) usage();
    const char* arg; 
    arg = argv[1];

    NSString* nsarg;
    nsarg = [NSString stringWithUTF8String:arg];

    CFRange range;
    range.location = 0;
    range.length = [nsarg length];

    CFStringRef ref = NULL;
    ref = DCSCopyTextDefinition(NULL, (CFStringRef)nsarg, range);
    //NSLog(@"%@\n", ref);
    printf("%s\n", [(NSString*)ref UTF8String]);

    /*
    struct CFRange {
            CFIndex location;
            CFIndex lenght;
    };
    */

    /*
    CFStringRef DCSCopyTextDefinition (
            DCSDictionaryRef dictionary,
            CFStringRef textString,
            CFRange range
            );
    */
    [pool drain];
    return 0;
}
