//
//  YKActivityViewController.h
//  Demo
//
//  Created by taffy on 16/4/23.
//  Copyright © 2016年 maxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const YKActivityTypeWeChatSession = @"YKActivityTypeWeChatSession";   // 分享到好友
static NSString *const YKActivityTypeWeChatTimeline = @"YKActivityTypeWeChatTimeline";  // 分享到朋友圈

@interface ItemModel : NSObject

@property(nonatomic) NSString *title;
@property(nonatomic) NSString *descriptionString;
@property(nonatomic) UIImage *thumbImage;
@property(nonatomic) NSURL *url;

@end


@interface YKActivityViewController : UIActivityViewController


/**
 *  对 UIActivityViewController 的包装
 *
 *  @param model          ItemModel, 包括所有要分享的信息
 *  @param activities     要分想到的 application, YKActivityTypeWeChatSession,YKActivityTypeWeChatTimeline 等
 *  @param viewController 若 viewController 为 nil, 则不会自动调用 presentViewController：方法
 *
 *  @return YKActivityViewController
 */
+ (instancetype) newWithActivityItemModel: (ItemModel *)model
                    ApplicationActivities: (NSArray *)activities
                     showInViewController: (UIViewController *) viewController;

@end
