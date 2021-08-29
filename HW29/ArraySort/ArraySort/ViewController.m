//
//  ViewController.m
//  ArraySort
//
//  Created by Алена on 27.08.2021.
//

#import "ViewController.h"

@interface Array : NSObject
    @property (nonatomic, weak) id <ViewControllerDelegate> delegate;
    -(void) startSort;
@end

@implementation Array

-(void) startSort {
    NSArray * array = @[
        @"misha",
        @"petya",
        @"alena",
        @"sasha",
        @"vanya",
        @"mashaa"
    ];
    
    [self.delegate arraySort:array];
}

@end

@interface ViewController () <ViewControllerDelegate>

@property (strong,nonatomic) Array* array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.array = [[Array alloc] init];
    self.array.delegate = self;
    
    [self.array startSort];
}

- (void)arraySort:(NSArray *)array {
    NSArray *sortedArray = [array sortedArrayUsingComparator: ^NSComparisonResult(id lhs, id rhs) {
        
        NSString *separatorCharacter = @"a";
        if ([[lhs componentsSeparatedByString:separatorCharacter] count] >[[rhs componentsSeparatedByString:separatorCharacter] count])
            return NSOrderedAscending;
        else if ([[lhs componentsSeparatedByString:separatorCharacter] count] < [[rhs componentsSeparatedByString:separatorCharacter] count])
            return  NSOrderedDescending;
        return NSOrderedSame;
    }];
    
    NSLog(@"%@", sortedArray);
}

@end
