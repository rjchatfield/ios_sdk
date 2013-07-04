//
//  AIActivityPackage.m
//  AdjustIosApp
//
//  Created by Christian Wellenbrock on 03.07.13.
//  Copyright (c) 2013 adeven. All rights reserved.
//

#import "AIActivityPackage.h"

@implementation AIActivityPackage

- (NSString *)description {
    return [NSString stringWithFormat:@"%@%@ %@",
            self.kind, self.suffix, self.path];
}

- (NSString *)parameterString {
    if (self.parameters == nil) return @"Parameters: nil";

    NSMutableString *builder = [NSMutableString stringWithString:@"Parameters:"];
    for (NSString *key in self.parameters) {
        NSString *value = [self.parameters objectForKey:key];
        [builder appendFormat:@"\n\t%-16s %@", [key UTF8String], value];
    }
    return builder;
}

- (NSString *)successMessage {
    return [NSString stringWithFormat:@"Tracked %@%@", self.kind, self.suffix];
}

- (NSString *)failureMessage {
    return [NSString stringWithFormat:@"Failed to track %@%@", self.kind, self.suffix];
}

#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self == nil) return self;

    self.path = [decoder decodeObjectForKey:@"path"];
    self.userAgent = [decoder decodeObjectForKey:@"userAgent"];
    self.parameters = [decoder decodeObjectForKey:@"parameters"];
    self.kind = [decoder decodeObjectForKey:@"kind"];
    self.suffix = [decoder decodeObjectForKey:@"suffix"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.path forKey:@"path"];
    [encoder encodeObject:self.userAgent forKey:@"userAgent"];
    [encoder encodeObject:self.parameters forKey:@"parameters"];
    [encoder encodeObject:self.kind forKey:@"kind"];
    [encoder encodeObject:self.suffix forKey:@"suffix"];
}

@end
