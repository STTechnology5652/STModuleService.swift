//
//  STModuleServiceSwiftEmptyOC.m
//  STModuleService.swift_Example
//
//  Created by stephenchen on 2024/01/26.
//

#import "STModuleServiceSwiftEmptyOC.h"

@implementation STModuleServiceSwiftEmptyOC
+ (void)load {
#ifdef kENTERPRISE
    NSLog(@"has kEnterprise:%d", kENTERPRISE);
#else
    NSLog(@"no kEnterprise");
#endif
}
@end
