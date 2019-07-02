//
//  DACard.m
//  DeckOfOneCardObjC
//
//  Created by Darin Marcus Armstrong on 7/2/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import "DACard.h"

@implementation DACard

- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image {
    self = [super init];
    if (self) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation DACard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithCardSuit:suit image:image];
}

@end
