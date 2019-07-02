//
//  DACardController.m
//  DeckOfOneCardObjC
//
//  Created by Darin Marcus Armstrong on 7/2/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import "DACardController.h"
#import "DACard.h"


@implementation DACardController

+ (DACardController *)sharedController
{
    static DACardController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [DACardController new];
    });
    return sharedController;
}

- (void)drawNewCard:(void (^)(NSArray *))completion {
    NSURL * url = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            NSArray * cardsArray = topLevelDictionary[@"cards"];
            
            NSMutableArray * cardPlaceholder = [NSMutableArray new];
            
            for (NSDictionary * dictionary in cardsArray)
            {
                DACard * card = [[DACard alloc] initWithDictionary:dictionary];
                [cardPlaceholder addObject:card];
            }
            completion(cardPlaceholder);
        }
    }]resume];
}

- (void)fetchImageFromCard:(DACard *)card completion:(void (^)(UIImage *))completion {
    NSURL * imageURL = [NSURL URLWithString:card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
     {
         if (error)
         {
             NSLog(@"Error: %@, %@", error, [error localizedDescription]);
             completion(nil);
             return;
         }
         if (response)
         {
             NSLog(@"%@", response);
         }
         if (data)
         {
             UIImage * image = [UIImage imageWithData:data];
             completion(image);
         }
     }]resume];
}


@end
