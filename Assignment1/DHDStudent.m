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
        // Initialize the enrolledCourse with a set of 2 entries
        _enrolledCourses = [NSMutableSet setWithCapacity:2];
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

-(void) addCoursesFromPrompt {
    char cCourse[100];
    char moreCourse;
    double cHWWeight, cMidtermWeight, cFinalWeight;
    double cHWAverage, cMidtermScore, cFinalScore;
    
    do {
        // Ask for Course Name and it's Weight on Homework, Midterm, and Final
        NSLog(@"Enter register Course Name and its HomeWork, Midterm, Final Weight.\n");
        NSLog(@"Example: CPSC411 20 30 50\n");
        scanf("%s %lf %lf %lf", cCourse, &cHWWeight, &cMidtermWeight, &cFinalWeight);
        
        // Clear the Standard Input from Console
        fpurge(stdin);
        
        // Initialize the temporary Course.
        DHDCourse *tempCourse = [DHDCourse createCourse:[NSString stringWithUTF8String:cCourse]
                                         homeWorkWeight:cHWWeight
                                          midtermWeight:cMidtermWeight
                                            finalWeight:cFinalWeight];
        
        // Ask for the Course scores
        NSLog(@"Enter the earned scores for this course of HomeWork Average, Midterm, and Final.\n");
        NSLog(@"Example: 75.5 78 88");
        scanf("%lf %lf %lf", &cHWAverage, &cMidtermScore, &cFinalScore);
        // Clear the Standard Input from Console
        fpurge(stdin);
        
        // Update the scores
        tempCourse.homeworkAverageScore = cHWAverage;
        tempCourse.midtermScore = cMidtermScore;
        tempCourse.finalScore = cFinalScore;
        
        // Add the newly entered course to the enrollCourses Set
        [_enrolledCourses addObject:tempCourse];
        tempCourse = nil;
        
        NSLog(@"Do you want to add more course? (Y/N)");
        scanf("%c", &moreCourse);
        // Clear the Standard Input from Console
        fpurge(stdin);

      } while ( moreCourse == 'Y' || moreCourse == 'y');
}

-(void) showStudentInfo {
    //TODO
    NSLog(@"Student Name is: %@ %@\n", _firstName, _lastName);
    NSLog(@"Student CWID: %@\n", _CWID);
    NSLog(@"Courses enrolled and grades\n");
    for (DHDCourse* course in _enrolledCourses) {
        //TODO
        //NSLog(@"Course: %@", course);
        [course showCourseInfo];
    }
}

@end
