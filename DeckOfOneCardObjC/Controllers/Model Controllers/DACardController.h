//
//  DACardController.h
//  DeckOfOneCardObjC
//
//  Created by Darin Marcus Armstrong on 7/2/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DACard.h"


@interface DACardController : NSObject

+ (DACardController *)sharedController;

- (void)drawNewCard:(void (^) (NSArray *))completion;

- (void)fetchImageFromCard:(DACard *)card completion:(void(^) (UIImage *))completion;

@end


