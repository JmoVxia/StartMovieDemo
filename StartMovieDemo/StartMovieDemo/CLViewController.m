//
//  CLViewController.m
//  StartMovieDemo
//
//  Created by JmoVxia on 2016/10/14.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "CLViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

#define KscreenHeught  [UIScreen mainScreen].bounds.size.height
#define KscreenWidth   [UIScreen mainScreen].bounds.size.width
#define Kscreen        [UIScreen mainScreen].bounds

static NSString *const kAppVersion = @"appVersion";


@interface CLViewController ()
/**播放器*/
@property (strong, nonatomic) MPMoviePlayerController *player;
/**登录按钮*/
@property (nonatomic,strong) UIButton *loginButton;
/**注册按钮*/
@property (nonatomic,strong) UIButton *registerButton;
/**音乐播放器*/
@property(nonatomic ,strong)AVAudioSession *avaudioSession;


@end

@implementation CLViewController
//视频播放器
- (MPMoviePlayerController *)player
{
    if (!_player) {
        _player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
        _player.controlStyle = MPMovieControlStyleNone;
        _player.shouldAutoplay = YES;
        _player.repeatMode = MPMovieRepeatModeOne;
        [_player setFullscreen:YES animated:YES];
        _player.scalingMode = MPMovieScalingModeAspectFit;
        _player.view.frame = Kscreen;
        [_player prepareToPlay];
        _player.view.alpha = 0;
        [self.view addSubview: _player.view];
        [UIView animateWithDuration:2.0 animations:^{
            _player.view.alpha = 1;
        }];
    }
    return _player;
}
//登录按钮
- (UIButton *) loginButton
{
    if (_loginButton==nil)
    {
        _loginButton=[[UIButton alloc]initWithFrame:CGRectMake(24+(KscreenWidth - 48)/2+24/2, KscreenHeught - 32 - 48, (KscreenWidth - 48)/2-24/2, 48)];
        _loginButton.layer.borderWidth = 0.5;
        _loginButton.layer.cornerRadius = 3.0;
        _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginButton.backgroundColor = [UIColor colorWithRed:0.64706f green:0.62745f blue:0.64314f alpha:0.4f];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.alpha = 0;
        [_player.view addSubview:_loginButton];
        [UIView animateWithDuration:3.0 animations:^{
            _loginButton.alpha = 1.0;
        }];
    }
    return _loginButton;
}
//注册按钮
- (UIButton *) registerButton
{
    if (_registerButton==nil)
    {
        _registerButton=[[UIButton alloc]initWithFrame:CGRectMake(24, KscreenHeught - 32 - 48, (KscreenWidth - 48)/2-24/2, 48)];
        [self.view addSubview:_registerButton];
        _registerButton.layer.borderWidth = 0.5;
        _registerButton.layer.cornerRadius = 3.0;
        _registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _registerButton.backgroundColor = [UIColor colorWithRed:0.12157f green:0.10196f blue:0.08627f alpha:0.4f];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        _registerButton.alpha = 0;
        [_player.view addSubview:_registerButton];
        [UIView animateWithDuration:3.0 animations:^{
            _registerButton.alpha = 1.0;
        }];
    }
    return _registerButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    /**
     *  设置其他音乐软件播放的音乐不被打断
     */
    self.avaudioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [self.avaudioSession setCategory:AVAudioSessionCategoryAmbient error:&error];
    
    [self.player play];
    [self.loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginAction:(UIButton *)loginButton
{
    NSLog(@"登录");
}

- (void)registerAction:(UIButton *)button
{
    NSLog(@"注册");
}




//判断是不是首次登录或者版本更新
+(BOOL )isFirstLauch{
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    //获取上次启动应用保存的appVersion
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:kAppVersion];
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentAppVersion forKey:kAppVersion];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        return NO;
    }
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    
    return YES;
}


@end
