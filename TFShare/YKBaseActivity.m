//
//  YKBaseActivity.m
//  Demo
//
//  Created by taffy on 16/4/23.
//  Copyright © 2016年 maxiao. All rights reserved.
//

#import "YKBaseActivity.h"

@implementation YKBaseActivity

+ (UIActivityCategory)activityCategory {
  return UIActivityCategoryShare;
}

- (void)performActivity {
  [self activityDidFinish:YES];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
  return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
  
  if (![activityItems.firstObject isKindOfClass:[ItemModel class]]) {
    NSAssert(NO, @"不是 ItemModel 类型，不能识别");
    return;
  }
}

@end
