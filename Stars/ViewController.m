//
//  ViewController.m
//  Stars
//
//  Created by AragonUit on 3/22/16.
//  Copyright © 2016 AragonUit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView* starGreen;
    UIImageView* starRed;
    UIImageView* starBrown;
    UIImageView* starViolet;
    CGPoint center;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SettingStars];
    [self animationStars];
}

-(void)SettingStars{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height ;
    starRed =[[UIImageView alloc]initWithFrame:CGRectMake(0,0,60,60)];
    starGreen =[[UIImageView alloc]initWithFrame:CGRectMake(0,0,60,60)];
    starBrown =[[UIImageView alloc]initWithFrame:CGRectMake(0,0,60,60)];
    starViolet =[[UIImageView alloc]initWithFrame:CGRectMake(0,0,60,60)];
    starRed.image=[UIImage imageNamed:@"red.png"];
    starBrown.image=[UIImage imageNamed:@"brown.png"];
    starGreen.image=[UIImage imageNamed:@"green.png"];
    starViolet.image=[UIImage imageNamed:@"violet.png"];
    center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height+statusNavigationBarHeight)*0.5);
    [self defaultStar];
    [self.view addSubview:starRed];
    [self.view addSubview:starGreen];
    [self.view addSubview:starViolet];
    [self.view addSubview:starBrown];
    
    
}
-(void)animationStars
{
    [UIView animateWithDuration:1 animations:^{
        starBrown.center = CGPointMake(center.x - 100, center.y - 100);
        starRed.center = CGPointMake(center.x + 100 ,center.y + 100);
        starGreen.center = CGPointMake(center.x + 100, center.y - 100);
        starViolet.center = CGPointMake(center.x - 100, center.y + 100);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            starBrown.center = CGPointMake(center.x - 100, center.y );
            starGreen.center = CGPointMake(center.x  ,center.y - 100);
            starRed.center = CGPointMake(center.x + 100, center.y );
            starViolet.center = CGPointMake(center.x , center.y + 100);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:3 animations:^{
                [self defaultStar];
            } completion:^(BOOL finished){
                [self animationStars];
            }];
        }];
    }];

}
-(void)defaultStar{
    starRed.center=center;
    starViolet.center=center;
    starBrown.center=center;
    starGreen.center=center;
}
@end
