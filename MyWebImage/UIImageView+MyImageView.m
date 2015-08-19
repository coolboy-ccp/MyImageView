//
//  UIImageView+MyImageView.m
//  MyImageView
//
//  Created by liqunfei on 15/8/18.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "UIImageView+MyImageView.h"

@implementation UIImageView (MyImageView)

- (void) webImageWithURL:(NSURL *)url placeHolderImage:(UIImage *)placeHolderImage downloadFlag:(NSUInteger)flag
{
    [self setUserInteractionEnabled:NO];
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
    [self.layer removeAllAnimations];
    [self setImage:placeHolderImage];
    UIActivityIndicatorView *active = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    active.tag = 10001;
    [self addSubview:active];
    [active setCenter:CGPointMake(self.center.x-10, self.center.y)];
    [active startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/%lu",url.description.hash];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (!data) {
          // http://img3.imgtn.bdimg.com/it/u=1827309971,3806408816&fm=21&gp=0.jpg
            NSLog(@"prepare for download:%@",url);
            data = [NSData dataWithContentsOfURL:url];
            [data writeToFile:filePath atomically:YES];
        }
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [active stopAnimating];
            [active removeFromSuperview];
            if (self.tag == flag) {
                [self setImage:image];
                [self setUserInteractionEnabled:YES];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBigImage:)];
                [self addGestureRecognizer:tap];
            }
        });
    });
}

- (void)showBigImage:(UITapGestureRecognizer *)sender {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIViewController *vc = [window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"myImage"];
    MyImageAnimation *myImage = (MyImageAnimation *)vc.view;
    NSLog(@"%@",self.image);
    [myImage setFrontImage:self.image];
    CGRect originFrame = [self convertRect:self.frame toView:window];
    originFrame.origin.x -= 10;
    originFrame.origin.y -= 10;
    [myImage setOriginFrame:originFrame];
    myImage.delegate = (id<MyImageAnimationDelegate>)self;
    [self setHidden:YES];
    [window.rootViewController.view addSubview:myImage];
}

- (void)willFinishedAnimation {
    [self setHidden:NO];
}
@end
