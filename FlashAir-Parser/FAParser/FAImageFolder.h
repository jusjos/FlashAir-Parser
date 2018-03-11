//
//  FAImageFolder.h
//  FlashAir-Parser
//
//  Created by JUSTIN on 11/03/18.
//  Copyright © 2018 JUSTIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FAImage.h"

@interface FAImageFolder : NSObject
    @property (nonatomic, strong) NSString *folderName;
    @property (nonatomic, strong) NSArray<FAImage *> *arrayOfImagesInFolder;
@end
