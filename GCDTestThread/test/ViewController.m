//
//  ViewController.m
//  test
//
//  Created by gc on 2017/7/29.
//  Copyright © 2017年 gc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self performSelectorInBackground:@selector(syncAndGloal) withObject:nil];
}

#pragma mark - 同步串行
- (IBAction)syncAndSerial:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 同步并行
- (IBAction)syncAndConcurrent:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 同步主队列
- (IBAction)syncAndMain:(id)sender {
    //程序卡死，syncAndMain任务被加进队列，等待执行，执行中遇到dispatch_sync任务，dispatch_sync任务需要等待上一个任务完成才能执行，而上一个任务syncAndMain又要等待dispatch_sync任务结束才能完全结束， 所以，要使用，必须开一条子线程调用syncAndMain
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 同步global队列
- (IBAction)syncAndGlobal:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 异步串行
- (IBAction)asyncAndSerial:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 异步并行
- (IBAction)asyncAndConcurrent:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"4 ++++ 1 ++++ %d ++++ %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"4 ++++ 2 ++++ %d ++++ %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"4 ++++ 3 ++++ %d ++++ %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 异步主队列
- (IBAction)asyncAndMain:(id)sender {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
}

#pragma mark - 异步global队列
- (IBAction)asyncAndGloal:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 1 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 2 **** %d **** %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"1 **** 3 **** %d **** %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 1 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 2 ---- %d ---- %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"2 ---- 3 ---- %d ---- %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 1 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 2 ==== %d ==== %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"3 ==== 3 ==== %d ==== %@",i,[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i< 3; i++) {
            NSLog(@"4 ++++ 1 ++++ %d ++++ %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"4 ++++ 2 ++++ %d ++++ %@",i,[NSThread currentThread]);
        }
        for (int i = 0; i< 3; i++) {
            NSLog(@"4 ++++ 3 ++++ %d ++++ %@",i,[NSThread currentThread]);
        }
    });
}

@end
