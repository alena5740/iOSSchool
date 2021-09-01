//
//  Test.m
//  Interop
//
//  Created by Алена on 01.09.2021.
//

#import "Test.h"
#import "Interop-Swift.h"

@interface Test ()

@end

@implementation Test

- (void)foo {
    ViewController *vc = [[ViewController alloc] init];
    vc.string;
    vc.struct1;
}
@end
