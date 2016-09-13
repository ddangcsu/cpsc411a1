//
//  DHDStudent.h
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import <Foundation/Foundation.h>

// Forward declare a class
@class DHDCourse;

@interface DHDStudent : NSObject

// Declare a set of Student Properties
@property (nonatomic) NSString* firstName;
@property (nonatomic) NSString* lastName;
@property (nonatomic) NSString* CWID;
@property (nonatomic, readonly) NSString* fullName;

// Initializer
-(id) init;
-(id) initWithFirstName: (NSString*) fname
               lastName: (NSString*) lname
                andCWID: (NSString*) cwid;

// Class method to create a new student via prompt
+(id) createStudentFromPrompt;

// Method to display the student information
-(NSString*) fullName;
-(BOOL) enrolledCourse: (DHDCourse*) course;
-(BOOL) updateCourseWeight: (NSString*) courseName
        withHWWeight: (double) hWeight
       midtermWeight: (double) mWeight
         finalWeight: (double) fWeight;
-(BOOL) updateCourseScore: (NSString*) courseName
         withHWScore: (double) hwScore
        midtermScore: (double) mScore
          finalScore: (double) fScore;
-(void) showStudentInfo;

-(void) addCoursesFromPrompt;


@end
