//
//  videoView.m
//  xiaoshipin
//
//  Created by yangxutao on 16/11/18.
//  Copyright © 2016年 yangxutao. All rights reserved.
//

#import "videoView.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "PKShortVideo.h"
@interface videoView ()<PKShortVideoRecorderDelegate>
@property (nonatomic, strong) PKShortVideoRecorder *recorder;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int interval;
@end


@implementation videoView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _interval = 11;
        [self loadView];
    }
    return self;
}


- (void)loadView {
    UIButton *startBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 320, 40, 40)];
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    startBtn.backgroundColor = [UIColor purpleColor];
    [startBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchDown];
    [startBtn addTarget:self action:@selector(stopRecording) forControlEvents:UIControlEventTouchUpInside];
    startBtn.layer.masksToBounds = YES;
    startBtn.layer.cornerRadius = 20;
    [self addSubview:startBtn];
    
//    UIButton *stopBtn = [[UIButton alloc]initWithFrame:CGRectMake(150, 50, 40, 40)];
//    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
//    stopBtn.backgroundColor = [UIColor redColor];
//    [stopBtn addTarget:self action:@selector(stopRecording) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:stopBtn];
    
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *videoPath = [path stringByAppendingPathComponent:@"video.mp4"];
    
    _recorder = [[PKShortVideoRecorder alloc]initWithOutputFilePath:videoPath outputSize:CGSizeMake(320, 240)];
    _recorder.delegate = self;
    
    [self previewVideo];

}

- (void)previewVideo {
    AVCaptureVideoPreviewLayer *previewLayer = [self.recorder previewLayer];
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    previewLayer.frame = CGRectMake(0, 0, 320, 240);
    [self.layer insertSublayer:previewLayer atIndex:0];
    [_recorder startRunning];
    
}

- (void)start {
    [self.timer fire];
    [_recorder startRecording];
}

- (void)stopRecording {
 
    [_recorder stopRunning];
    [_recorder stopRecording];
    
}






- (void)count {
        [self stopRecording];

}

#pragma mark PKShortVideoRecorderDelegate
- (void)recorderDidEndRecording:(PKShortVideoRecorder *)recorder {
    NSLog(@"结束");
}

- (void)recorderDidBeginRecording:(PKShortVideoRecorder *)recorder {
    NSLog(@"开始");
}

- (void)recorder:(PKShortVideoRecorder *)recorder didFinishRecordingToOutputFilePath:(NSString *)outputFilePath error:(NSError *)error {
    
            [self saveToLibraryWithURL:[NSURL URLWithString:outputFilePath]];
    
}


- (void)saveToLibraryWithURL:(NSURL *)url {
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
    [library writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
            NSLog(@"error:----%@",error.description);
        }else {
            NSLog(@"保存成功");
            //                [self getAllVideo];
        }
    }];
}

- (void)dealloc {
    
}



@end
