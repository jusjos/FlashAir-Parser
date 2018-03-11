//
//  FAParser.h
//  FlashAir-Parser
//
//  Created by JUSTIN on 11/03/18.
//  Copyright © 2018 JUSTIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAImageFolder.h"

@interface FAParser : NSObject

/*
 This method is to be called when connected to a Toshiba Wifi FlashAir device. It will return an array of all image files.
 */
- (NSArray<FAImageFolder *> *)createAnArrayOfFoldersThatHaveImagesFromCamera;

@end
