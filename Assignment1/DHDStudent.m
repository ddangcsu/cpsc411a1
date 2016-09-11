//
//  DHDStudent.m
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import "DHDStudent.h"

@implementation DHDStudent

-(id) init {
    self = [self initWithFirstName:nil lastName:nil andCWID:nil];
    return self;
}

-(id) initWithFirstName:(NSString *)fname lastName:(NSString *)lname
                andCWID:(NSString *)cwid {
    
    if (self = [super init]) {
        _firstName = fname;
        _lastName = lname;
        _CWID = cwid;
        _enrolledCourses = nil;
    }
    return self;
}

+(id) createStudentFromPrompt {
    // Use C scanf to read in the data from console
    char cFirstName[100], cLastName[100], cCWID[10];
    NSLog(@"Enter Student Full Name and CWID");
    NSLog(@"Example: David Dang 12345");
    scanf("%s %s %s", cFirstName, cLastName, cCWID);
    
    // Create and return the student object
    return [[self alloc]
            initWithFirstName:[NSString stringWithUTF8String:cFirstName]
            lastName:[NSString stringWithUTF8String:cLastName]
            andCWID:[NSString stringWithUTF8String:cCWID]];
    
}

-(void) showStudentInfo {
    //TODO
    NSLog(@"Student Name is: %@ %@\n", _firstName, _lastName);
    NSLog(@"Student CWID: %@\n", _CWID);
    NSLog(@"Courses enrolled and grades\n");
    for (id course in _enrolledCourses) {
        //TODO
        NSLog(@"Course: %@", course);
    }
}

@end
