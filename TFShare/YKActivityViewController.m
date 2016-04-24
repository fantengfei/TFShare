//
//  YKActivityViewController.m
//  Demo
//
//  Created by taffy on 16/4/23.
//  Copyright © 2016年 maxiao. All rights reserved.
//

#import "YKActivityViewController.h"
#import "YKWeChatSessionActivity.h"
#import "YKWeChatTimeLineActivity.h"
#import "WXApi.h"

@implementation ItemModel

@end


@implementation YKActivityViewController


+ (instancetype) newWithActivityItemModel:(ItemModel *)model
                    ApplicationActivities:(NSArray *)activities
                     showInViewController:(UIViewController *)viewController {

  
  
  YKActivityViewController *vc = [[YKActivityViewController alloc] initWithActivityItems:__getActivityItems(model)
                                                                   applicationActivities:__getApplicationActivities(activities)];
  vc.excludedActivityTypes = @[UIActivityTypePostToFacebook,
                               UIActivityTypePostToTwitter,
                               // UIActivityTypePostToWeibo,
                               // UIActivityTypeMessage,
                               UIActivityTypeMail,
                               UIActivityTypePrint,
                               UIActivityTypeCopyToPasteboard,
                               UIActivityTypeAssignToContact,
                               UIActivityTypeSaveToCameraRoll,
                               UIActivityTypeAddToReadingList,
                               UIActivityTypePostToFlickr,
                               UIActivityTypePostToVimeo,
                               // UIActivityTypePostToTencentWeibo,
                               UIActivityTypeAirDrop,
                               UIActivityTypeOpenInIBooks];
  
  if (viewController) {
    [viewController presentViewController:vc animated:YES completion:nil];
  }

  return vc;
}

NSArray *__getActivityItems(ItemModel *model) {
//  NSMutableArray *items = [NSMutableArray array];
//  if (model.url) [items addObject:model.url];
//  if (model.title) [items addObject:model.title];
//  if (model.descriptionString) [items addObject:model.descriptionString];
//  if (model.thumbImage) [items addObject:model.thumbImage];
  return @[model];
}

NSArray *__getApplicationActivities(NSArray<NSString *> *activities) {
  NSMutableArray *array = [NSMutableArray array];
  for (NSString *activity in activities) {
    
    // 分享微信好友
    if (YKActivityTypeWeChatSession == activity) {
      // 是否装了微信 app
      if ([WXApi isWXAppInstalled]) {
        [array addObject:[YKWeChatSessionActivity new]];
      }
    }
    
    // 分享微信朋友圈
    if (YKActivityTypeWeChatTimeline == activity) {
      if ([WXApi isWXAppInstalled]) {
        [array addObject:[YKWeChatTimeLineActivity new]];
      }
    }
  }

  return [array copy];
}



@end
