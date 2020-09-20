//
//  Applescript_Prefpane.m
//  Applescript Prefpane
//
//  Created by Jonathan Alland on 9/20/20.
//  Copyright (c) 2020 Jonathan Alland. All rights reserved.
//

#import "Applescript_Prefpane.h"

@implementation Applescript_Prefpane

- (void)mainViewDidLoad
{
}

- (void)willSelect {
    NSString *scriptPath = [NSString stringWithFormat:@"%@%@", [[NSBundle bundleForClass:[self class]] resourcePath], @"/Main.scpt"];
    [self runApplescript: [NSMutableString stringWithFormat:@"run script \"%@\"", scriptPath]];
    
    [self performSelector:@selector(runApplescript:) withObject:[NSMutableString stringWithString:@"tell application \"System Preferences\" to set show all to true"] afterDelay:0.01];
}

- (void)runApplescript:(NSMutableString *)scriptSource {
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:scriptSource];
    NSDictionary *error;
    [[script executeAndReturnError:&error] stringValue];
}

@end
