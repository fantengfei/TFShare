//
//  YKWeChatActivity.m
//  Demo
//
//  Created by taffy on 16/4/23.
//  Copyright © 2016年 maxiao. All rights reserved.
//

#import "YKWeChatSessionActivity.h"
#import "WXApi.h"

@implementation YKWeChatSessionActivity

- (NSString *)activityType {
  return @"SceneSession.WeChatActivity";
}

- (NSString *)activityTitle {
  return @"微信好友";
}

- (UIImage *)activityImage {
  return [UIImage imageNamed:@"weixin"];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {

  [super prepareWithActivityItems:activityItems];
  
  ItemModel *model = activityItems.firstObject;
  WXMediaMessage *message = [WXMediaMessage message];
  message.title = model.title;
  message.description = model.descriptionString;
  [message setThumbImage:model.thumbImage];
  
  WXWebpageObject *ext = [WXWebpageObject object];
  ext.webpageUrl = model.url.absoluteString;
  
  message.mediaObject = ext;
  
  SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
  req.bText = NO;
  req.message = message;
  req.scene = WXSceneSession;
  
  [WXApi sendReq:req];
}

@end
