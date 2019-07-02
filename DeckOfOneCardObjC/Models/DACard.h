//
//  DACard.h
//  DeckOfOneCardObjC
//
//  Created by Darin Marcus Armstrong on 7/2/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DACard : NSObject

@property (nonatomic, copy, readonly) NSString * suit;
@property (nonatomic, copy, readonly) NSString * image;

- (instancetype)initWithCardSuit:(NSString *)suit
                           image:(NSString *)image;

@end

@interface DACard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
