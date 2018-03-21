//
//  FAParser.m
//  FlashAir-Parser
//
//  Created by JUSTIN on 11/03/18.
//  Copyright © 2018 JUSTIN. All rights reserved.
//

#import "FAParser.h"

@implementation FAParser

- (NSArray<FAImageFolder *> *)createAnArrayOfFoldersThatHaveImagesFromFlashair {
    
    NSString *baseCommandStringTillDCIM = @"http://flashair/command.cgi?op=100&DIR=/DCIM";
    NSString *basePathStringTillDCIM = @"http://flashair/DCIM";
    
    NSMutableArray<FAImageFolder *> *arrayOfFoldersWithImages = [[NSMutableArray alloc] init];
    NSError *error = nil;
    NSURL *urlForAllData = [NSURL URLWithString:baseCommandStringTillDCIM];
    NSString *stringOfFilesInDCIM = [NSString stringWithContentsOfURL:urlForAllData encoding:NSUTF8StringEncoding error:&error];
    NSArray *array_ComponentsOfStringOfFilesInDCIM = [stringOfFilesInDCIM componentsSeparatedByString:@"\r\n"];
    [array_ComponentsOfStringOfFilesInDCIM enumerateObjectsUsingBlock:^(NSString *stringOfFolderAttributes, NSUInteger idx, BOOL * _Nonnull stop) {
        if (stringOfFolderAttributes.length > 0 && ![stringOfFolderAttributes containsString:@"WLAN"] && ![stringOfFolderAttributes containsString:@".JPG"] && ![stringOfFolderAttributes containsString:@"TSB"]) {
            FAImageFolder *imageFolder = [[FAImageFolder alloc] init];
            NSArray *array_ComponentsOfStringOfFolderAttributes = [stringOfFolderAttributes componentsSeparatedByString:@","];
            NSString *folderName = array_ComponentsOfStringOfFolderAttributes[1];
            NSMutableArray<FAImage *> *arrayOfImagesInThisFolder = [[NSMutableArray alloc] init];
            NSURL *urlForFolderInfo = [NSURL URLWithString:[baseCommandStringTillDCIM stringByAppendingPathComponent:folderName]];
            NSError *error2 = nil;
            NSString *stringOfFilesInsideFolder = [NSString stringWithContentsOfURL:urlForFolderInfo encoding:NSUTF8StringEncoding error:&error2];
            NSArray *array_ComponentsOfStringOfFilesInsideFolder = [stringOfFilesInsideFolder componentsSeparatedByString:@"\r\n"];
            [array_ComponentsOfStringOfFilesInsideFolder enumerateObjectsUsingBlock:^(NSString *stringOfImageAttributes, NSUInteger idx, BOOL * _Nonnull stop) {
                if (stringOfImageAttributes.length > 0 && ![stringOfImageAttributes containsString:@"WLAN"] && [stringOfImageAttributes.uppercaseString containsString:@".JPG"]) {
                    NSArray *array_ComponentsOfStringOfImageAttributes = [stringOfImageAttributes componentsSeparatedByString:@","];
                    FAImage *image = [[FAImage alloc] init];
                    image.imageName = array_ComponentsOfStringOfImageAttributes[1];
                    image.imagePath = [basePathStringTillDCIM stringByAppendingFormat:@"/%@/%@", folderName, image.imageName];
                    [arrayOfImagesInThisFolder addObject:image];
                    imageFolder.folderName = folderName;
                }
            }];
            
            if (imageFolder.folderName != nil) {
                imageFolder.arrayOfImagesInFolder = [arrayOfImagesInThisFolder copy];
                [arrayOfFoldersWithImages addObject:imageFolder];
            }
        }
        
    }];
    
    return [arrayOfFoldersWithImages copy];
}

@end
