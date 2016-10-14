//
//  CLViewController.h
//  StartMovieDemo
//
//  Created by JmoVxia on 2016/10/14.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLViewController : UIViewController
/**视频URl*/
@property(nonatomic,strong)NSURL *movieURL;
/**判断是不是首次登录或者版本更新*/
+(BOOL)isFirstLauch;

@end
