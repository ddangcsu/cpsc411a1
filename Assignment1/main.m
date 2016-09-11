//
//  main.m
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHDStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a student
        DHDStudent* student = [DHDStudent createStudentFromPrompt];
        
        // Tell student to add all the register courses
        [student addCoursesFromPrompt];
        
        // Tell the student to display itself
        [student showStudentInfo];
    }
    return 0;
}
