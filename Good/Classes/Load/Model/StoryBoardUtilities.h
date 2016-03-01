//
//  StoryBoardUtilities.h
//  TheMovieDB
//
//  Created by Kevin Mindeguia on 09/02/2013.
//  Copyright (c) 2013 iKode Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface StoryBoardUtilities : NSObject

/**
 *  根据storyboardName和指定class获取viewController实例
 *
 *  @param storyboardName storyboardName
 *  @param class          指定class
 *
 *  @return viewController实例
 */
+ (UIViewController*)viewControllerForStoryboardName:(NSString*)storyboardName class:(id)class;

@end
