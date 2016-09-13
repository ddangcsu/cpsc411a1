//
//  DHDCourse.h
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHDCourse : NSObject

// Declare a set of properties for a course
@property (nonatomic) NSString* courseName;
@property (nonatomic) double homeworkWeight;
@property (nonatomic) double midtermWeight;
@property (nonatomic) double finalWeight;
@property (nonatomic) double homeworkAverageScore;
@property (nonatomic) double midtermScore;
@property (nonatomic) double finalScore;

// Initializer
-(id) init;
-(id) initCourseName: (NSString*) name
      homeWorkWeight: (double) hWeight
       midtermWeight: (double) mWeight
         finalWeight: (double) fWeight;

// Class method to create a course
+(id) createCourse: (NSString*) name
    homeWorkWeight: (double) hWeight
     midtermWeight: (double) mWeight
       finalWeight: (double) fWeight;

// Method to compute the overall score
-(double) calcScore;

// Display Course information
-(void) showCourseInfo;

@end
