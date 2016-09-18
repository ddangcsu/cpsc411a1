//
//  DHDCourse.m
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import "DHDCourse.h"

@implementation DHDCourse

/* 
    Default initializer to set the courses to empty
    @param: None
    @return: a DHDCourse object initialized to default values
 */
-(id) init {
    self = [self initCourseName:nil homeWorkWeight:0 midtermWeight:0 finalWeight:0];
    return self;
}

/*
    Initializer method to set the course with name and weights
    @param: (NSString*) name - Course Name
            (double) hWeight - Homework Weight
            (double) mWeight - Midterm Weight
            (double) fWeight - Final Weight
    @return: A DHDCourse object initialized with Name and Weights
 */
-(id) initCourseName: (NSString*) name
      homeWorkWeight: (double) hWeight
       midtermWeight: (double) mWeight
         finalWeight: (double) fWeight {
    
    if (self = [super init]) {
        self.courseName = name;
        self.homeworkWeight = hWeight;
        self.midtermWeight = mWeight;
        self.finalWeight = fWeight;
        self.homeworkAverageScore = 0;
        self.midtermScore = 0;
        self.finalScore = 0;
    }
    return self;
}

/*
    Initializer method to set the course with name and weights
    @param: (NSString*) name - Course Name
            (double) hWeight - Homework Weight
            (double) mWeight - Midterm Weight
            (double) fWeight - Final Weight
    @return: An allocated DHDCourse object initialized with Name and Weights
 */
+(id) createCourse: (NSString*) name
    homeWorkWeight: (double) hWeight
     midtermWeight: (double) mWeight
       finalWeight: (double) fWeight {
    
    return [[self alloc] initCourseName:name
                         homeWorkWeight:hWeight
                          midtermWeight:mWeight
                            finalWeight:fWeight];
    
}

/*
    Instance method to calculate the Course's overall score
    @param: None
    @return: A double represent the overall score calculated from the course's weights
            and the raw scores for Homework Average, Midterm, and Final.
 */
-(double) calcScore {
    double hwScore, mtScore, fScore;
    hwScore = (self.homeworkAverageScore * self.homeworkWeight)/100.0;
    mtScore = (self.midtermScore * self.midtermWeight)/100.0;
    fScore = (self.finalScore * self.finalWeight)/100.0;
    
    return (hwScore + mtScore + fScore);
}

/*
    Instance method to allow the course to display the course name along with
    the course's overall calculated grade.
    @param: None
    @return: None
 */
-(void) showCourseInfo {
    NSLog(@"Course Name: %@\n", self.courseName);
    NSLog(@"Course's Overall Grade: %f \n\n", [self calcScore]);
}

@end
