//
//  ViewController.h
//  ArraySort
//
//  Created by Алена on 27.08.2021.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate <NSObject>

- (void)arraySort:(NSArray *)array;

@end

@interface ViewController : UIViewController


@end

