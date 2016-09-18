//
//  main.m
//  Assignment1
//
//  Created by david on 9/11/16.
//  Copyright © 2016 David Dang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHDStudent.h"
#import "DHDCourse.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char continueFlag = '0';
        
        do {
            // Create a student
            DHDStudent* student = [DHDStudent createStudentFromPrompt];
        
            // Tell student to add all the register courses
            [student addCoursesFromPrompt];
        
            // Tell the student to display itself
            [student showStudentInfo];
            
            // Clear it so that it can reclaim the memory
            student = nil;
            
            NSLog(@"Do you want to enter another student? (Y/N)");
            scanf("%c", &continueFlag);
            fpurge(stdin);
            
        } while (continueFlag == 'Y' || continueFlag == 'y');
        
    }
    return 0;
}
