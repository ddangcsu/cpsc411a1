//
//  DHDStudent.h
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHDCourse.h"

@interface DHDStudent : NSObject

// Declare a set of Student Properties
@property (nonatomic) NSString* firstName;
@property (nonatomic) NSString* lastName;
@property (nonatomic) NSString* CWID;

// enrolledCourse
@property (nonatomic) NSMutableDictionary* enrolledCourses;

// Initializer
-(id) init;
-(id) initWithFirstName: (NSString*) fname
               lastName: (NSString*) lname
                andCWID: (NSString*) cwid;

// Class method to create a new student via prompt
+(id) createStudentFromPrompt;

// Method to display the student information
-(void) addCoursesFromPrompt;
-(void) showStudentInfo;

@end
