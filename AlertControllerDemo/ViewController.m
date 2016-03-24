//
//  ViewController.m
//  AlertControllerDemo
//
//  Created by guohui on 16/3/24.
//  Copyright © 2016年 guohui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)alertTypeShow:(id)sender;
- (IBAction)actionSheetShow:(id)sender;
- (IBAction)inputTypeShow:(id)sender;
- (IBAction)customerTypeShow:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertTypeShow:(id)sender {
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addAction:[UIAlertAction actionWithTitle:@"DefauleTitle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:@"cancelTitle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:@"DestructiveTitle" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"重置");
    }]];
    
    [alertControl addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UITextField *login = alertControl.textFields[0];
//        UITextField *password = alertControl.textFields[1];
//        [self.view endEditing:YES];
//        NSLog(@"登录:%@  密码:%@ ",login.text ,password.text);
    }]];
    
    
    
    [self presentViewController:alertControl animated:YES completion:nil];
    
    
}

- (IBAction)actionSheetShow:(id)sender {
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
}
- (IBAction)customerTypeShow:(id)sender {
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    
}

- (IBAction)inputTypeShow:(id)sender {
    //文本框只能是alert风格
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    

    
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"登录" ;
    }];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码" ;
        textField.secureTextEntry = YES ;
    }];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"添加监听代码" ;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alertControl addAction:[UIAlertAction actionWithTitle:@"cancelTitle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:@"DefauleTitle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }]];

    
    [self presentViewController:alertControl animated:YES completion:nil];
    
}

- (void)alertTextFieldDidChange:(NSNotification *)notification{
     UIAlertController *alertController = (UIAlertController *)self.presentedViewController;  // 不要错写为self.presentedViewController
    if (alertController) {
        //下标为2的是添加了坚挺的 也是最后一个alertcontroller.textfields.lastObject
        UITextField *listrn = alertController.textFields[2];
        //限制,如果listen输入长度要限制5个字内,否则不允许点击默认defalut 键
        UIAlertAction *action = alertController.actions.lastObject ;
        action.enabled = listrn.text.length >= 5 ;
        
        
    }
}





@end
