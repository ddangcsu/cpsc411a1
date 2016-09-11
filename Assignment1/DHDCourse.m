//
//  DHDCourse.m
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import "DHDCourse.h"

@implementation DHDCourse
// Initializer
-(id) init {
    self = [self initCourseName:nil homeWorkWeight:0 midtermWeight:0 finalWeight:0];
    return self;
}

-(id) initCourseName: (NSString*) name
      homeWorkWeight: (double) hWeight
       midtermWeight: (double) mWeight
         finalWeight: (double) fWeight {
    
    if (self = [super init]) {
        _courseName = name;
        _homeworkWeight = hWeight;
        _midtermWeight = mWeight;
        _finalWeight = fWeight;
        _homeworkAverageScore = 0;
        _midtermScore = 0;
        _finalScore = 0;
    }
    return self;
}

// Class method to create a course
+(id) createCourse: (NSString*) name
    homeWorkWeight: (double) hWeight
     midtermWeight: (double) mWeight
       finalWeight: (double) fWeight {
    
    return [[self alloc] initCourseName:name
                         homeWorkWeight:hWeight
                          midtermWeight:mWeight
                            finalWeight:fWeight];
    
}

// Method to compute the overall score
-(double) calcScore {
    double hwScore, mtScore, fScore;
    hwScore = (_homeworkAverageScore * _homeworkWeight)/100.0;
    mtScore = (_midtermScore * _midtermWeight)/100.0;
    fScore = (_finalScore * _finalWeight)/100.0;
    
    return (hwScore + mtScore + fScore);
}

// Display Course information
-(void) showCourseInfo {
    //TODO
    NSLog(@"Course Name: %@\n", _courseName);
    NSLog(@"Course OverAll Grade: %f \n\n", [self calcScore]);
}

@end
