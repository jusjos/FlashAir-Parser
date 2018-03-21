//
//  ViewController.m
//  FlashairTest
//
//  Created by JUSTIN on 20/05/17.
//  Copyright © 2017 JUSTIN. All rights reserved.
//


#import "ViewController.h"
#import "FAParser.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray<FAImageFolder *> *arrayOfFoldersWithImagesInFlashair;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FAParser *flashAirParser = [[FAParser alloc] init];
    arrayOfFoldersWithImagesInFlashair = [flashAirParser createAnArrayOfFoldersThatHaveImagesFromFlashair];
    
    /*
     arrayOfFoldersWithImagesInFlashair will contain all images in your flashair wifi device ordered by folder name
     */
}


@end
