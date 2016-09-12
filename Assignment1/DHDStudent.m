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
        _enrolledCourses = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    return self;
}

+(id) createStudentFromPrompt {
    // Use C scanf to read in the data from console
    char cFirstName[100] = {0};
    char cLastName[100] = {0};
    char cCWID[10] = {0};
    NSLog(@"Enter Student Full Name and CWID. Example: David Dang 12345");
    scanf("%s %s %s", cFirstName, cLastName, cCWID);
    fpurge(stdin);
    
    //TODO Validation if necessary
    
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
    BOOL isValid;
    
    do {
        // Initialized variable
        moreCourse = 'N';
        
        // Loop to input Course Name and its weights
        do  {
            // Initialize all the local variables
            cHWWeight = cMidtermWeight = cFinalWeight = 0.0;
            memset(cCourse, '\0', sizeof(cCourse));
            
            // Ask for Course Name and it's Weight on Homework, Midterm, and Final
            NSLog(@"Enter register Course Name and its HomeWork, Midterm, Final Weight.\n");
            NSLog(@"Make sure total Weight is 100.  Example: CPSC411 20 30 50\n");
            scanf("%s %lf %lf %lf", cCourse, &cHWWeight, &cMidtermWeight, &cFinalWeight);
        
            // Clear the Standard Input from Console
            fpurge(stdin);
        
            // TODO: Validation of the course weights
            if ( (cHWWeight + cMidtermWeight + cFinalWeight) == 100.0 ) {
                isValid = YES;
            } else {
                isValid = NO;
                NSLog(@"Invalid total Weight for the course.  Please re-enter");
            }
        } while (! isValid); // Loop if enter invalid weight
        
        // Initialize the temporary Course.
        DHDCourse *tempCourse = [DHDCourse createCourse:[[NSString stringWithUTF8String:cCourse] uppercaseString]
                                         homeWorkWeight:cHWWeight
                                          midtermWeight:cMidtermWeight
                                            finalWeight:cFinalWeight];
        
        // Loop to ask for valid course's scores
        do {
            cHWAverage = cMidtermScore = cFinalScore = 0.0;
            NSLog(@"Enter Course's Scores of HomeWork Average, Midterm, and Final. Example: 75.5 78 88");
            scanf("%lf %lf %lf", &cHWAverage, &cMidtermScore, &cFinalScore);
            
            // Clear the Standard Input from Console
            fpurge(stdin);
        
            // TODO: Validate of scores between 0 and 300. (No Extra Credit allow)
            if ( (cHWAverage + cMidtermScore + cFinalScore) >= 0.0 &&
                 (cHWAverage + cMidtermScore + cFinalScore) <= 300 ) {
                isValid = YES;
            } else {
                isValid = NO;
                NSLog(@"Invalid total scores.  Please re-enter");
            }
        } while (! isValid);
        
        // Update the scores
        tempCourse.homeworkAverageScore = cHWAverage;
        tempCourse.midtermScore = cMidtermScore;
        tempCourse.finalScore = cFinalScore;
        
        // Add the newly entered course to the enrollCourses Set
        [_enrolledCourses setObject:tempCourse forKey: tempCourse.courseName];
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
    NSLog(@"List of enrolled courses and grades:\n");
    NSLog(@"\n");
    
    // Loop through the dictionary and tell each course to display itself
    for (id key in _enrolledCourses) {
        DHDCourse* course = [_enrolledCourses objectForKey: key];
        [course showCourseInfo];
    }
}

@end
