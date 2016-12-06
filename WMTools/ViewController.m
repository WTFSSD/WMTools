//
//  ViewController.m
//  WMTools
//
//  Created by WTFSSD on 2016/12/4.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import "ViewController.h"
#import "Toast.h"

#import "WMExtention.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(UIButton *)sender forEvent:(UIEvent *)event {
    [Toast makeToast:^(Toast *toast) {
        toast.setMsg(@"233".add(event).rm_c(@"()[]{}<>\n"))
        .hiddenAfter(3)
        .show(AnimationTypeFade);
    }];

}

@end
