//
//  YKWeChatTimeLineActivity.m
//  Demo
//
//  Created by taffy on 16/4/23.
//  Copyright © 2016年 maxiao. All rights reserved.
//

#import "YKWeChatTimeLineActivity.h"
#import "WXApi.h"

@implementation YKWeChatTimeLineActivity

- (NSString *)activityType {
  return @"TimeLine.WeChatActivity";
}

- (NSString *)activityTitle {
  return @"微信朋友圈";
}

- (UIImage *)activityImage {
  return [UIImage imageNamed:@"timeline"];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
  
  [super prepareWithActivityItems:activityItems];
  
  ItemModel *model = activityItems.firstObject;
  WXMediaMessage *message = [WXMediaMessage message];
  message.title = [NSString stringWithFormat:@"%@，%@", model.title, model.descriptionString];
  [message setThumbImage:model.thumbImage];
  
  WXWebpageObject *ext = [WXWebpageObject object];
  ext.webpageUrl = model.url.absoluteString;
  
  message.mediaObject = ext;
  
  SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
  req.bText = NO;
  req.message = message;
  req.scene = WXSceneTimeline;
  
  [WXApi sendReq:req];
}

@end
