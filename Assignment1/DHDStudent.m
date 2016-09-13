//
//  DHDStudent.m
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import "DHDStudent.h"
#import "DHDCourse.h"

@implementation DHDStudent
{
    // Private Dictionary
    NSMutableDictionary* _enrolledCourses;
}

/*
    Default Initializer method to create an empty Student Instance
    Input: None
    Output: A DHDStudent object initialized to empty
 */
-(id) init {
    self = [self initWithFirstName:nil lastName:nil andCWID:nil];
    return self;
}

/*
    Initializer method to populate the student instance with firstName, lastName, and
    CWID.  It will also initialize the enrolledCourses to have an initial capacity of 2
    Input:  (NSString*) fname   - First Name of the Student
            (NSString*) lname   - Last Name of the Student
            (NSString*) cwid    - The Student Campus Wide ID
    Output: A DHDStudent object initialized with firstName, lastName, and CWID
 */
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

/*
    Class method to allow the creation of a Student Instance via Console.  The console
    will prompt for the following information:
        - firstName, lastName, and CWID
    
    Input: Interactive Console
    Output: An allocated DHDStudent object initialized with firstName, lastName, and CWID
 */
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

/*
    Getter method to return the full name of the student in First Last format
    Input: None
    Output: an NSString of the student full name in First Last format
 */
-(NSString*) fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

/*
    Instance method for a student to add a course.
    Input: course   - a DHDCourse instance
    Output: YES if successfully add a course.  NO if failed.
 */
-(BOOL) enrolledCourse: (DHDCourse*) course {
    if ([_enrolledCourses objectForKey:course.courseName] == nil) {
        [_enrolledCourses setObject:course forKey: course.courseName];
        return YES;
    }
    NSLog(@"ERROR: Course %@ already exists.  Ignore adding course", course.courseName);
    return NO;
}

/*
    Instance method to update course with new weights
    Input:  (NSString*) courseName   - String Name of the Course
            (double) hWeight    - HomeWork Weight
            (double) mWeight    - Midterm Weight
            (double) fWeight    - Final Weight
    Output: YES if success else NO if error
 */
-(BOOL) updateCourseWeight: (NSString*) courseName
        withHWWeight: (double) hWeight
       midtermWeight: (double) mWeight
         finalWeight: (double) fWeight {
    
    NSString* key = [courseName uppercaseString];
    DHDCourse* course;
    
    if ((course = [_enrolledCourses objectForKey:key])) {
        // Course exists/found in dictionary
        course.homeworkWeight = hWeight;
        course.midtermWeight = mWeight;
        course.finalWeight = mWeight;
        course = nil;
        key = nil;
        return YES;
    }
    return NO;
}

/*
    Instance method to update course's score
    Input:  (NSString*) courseName   - String Name of the Course
            (double) hwScore    - HomeWork Average Score
            (double) mScore    - Midterm Score
            (double) fScore    - Final Score
    Output: YES if success else NO if error
 */
-(BOOL) updateCourseScore: (NSString*) courseName
         withHWScore: (double) hwScore
        midtermScore: (double) mScore
          finalScore: (double) fScore {
    NSString* key = [courseName uppercaseString];
    DHDCourse* course;
    
    if ((course = [_enrolledCourses objectForKey:key])) {
        // Course exists/found in dictionary
        course.homeworkAverageScore = hwScore;
        course.midtermScore = mScore;
        course.finalScore = fScore;
        course = nil;
        key = nil;
        return YES;
    }
    return NO;
}

/*
    Instance method to allow the student to display its own information.
    Display information include student Full Name, his/her CWID and all the courses
    information.
    Input: None
    Output: None
 */
-(void) showStudentInfo {
    
    NSLog(@"Student Name is: %@", self.fullName);
    NSLog(@"Student CWID: %@", self.CWID);
    NSLog(@"List of enrolled courses and grades:\n");
    NSLog(@"\n");
    
    // Loop through the dictionary and tell each course to display itself
    for (id key in _enrolledCourses) {
        // Get the course for each given key in the enrolledCourses dictionary
        DHDCourse* course = [_enrolledCourses objectForKey: key];
        [course showCourseInfo];
    }
}

/*
    Instance method to allow adding courses to a student via Interactive Input Console.
    The following information will be prompt from the Console:
        - course Name, course Weights for Home Work, Midterm, and Final
        - course's earned score for Home Work Average, Midterm Score, and Final Score
 
    The result of the course will be added to the student's enrolledCourses Dictionary.
 
    Input: Interactive Console
    Output: None
 */
-(void) addCoursesFromPrompt {
    char cCourse[100];
    char moreCourse;
    double cHWWeight, cMidtermWeight, cFinalWeight;
    double cHWAverage, cMidtermScore, cFinalScore;
    BOOL isValid, success;
    
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
        DHDCourse *course = [DHDCourse createCourse: [[NSString stringWithUTF8String:cCourse] uppercaseString]
                                     homeWorkWeight:cHWWeight
                                      midtermWeight:cMidtermWeight
                                        finalWeight:cFinalWeight];
        
        // Enroll/add the course to the student
        success = [self enrolledCourse:course];
        if ( ! success ) {
            NSLog(@"ERROR: Unable to add course.  Course %@ already added", course.courseName);
        };
        
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
        success = [self updateCourseScore:course.courseName
                    withHWScore:cHWAverage
                   midtermScore:cMidtermScore
                     finalScore:cFinalScore];
        
        if ( !success ) {
            NSLog(@"ERROR: Unable to update course's Score.  Course %@ does not exist.", course.courseName);
        }
        
        // Clear the pointers
        course = nil;
        
        NSLog(@"Do you want to add more course? (Y/N)");
        scanf("%c", &moreCourse);
        // Clear the Standard Input from Console
        fpurge(stdin);
        
    } while ( moreCourse == 'Y' || moreCourse == 'y');
}

@end
