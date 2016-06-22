//
//  FISBlackjackPlayer.h
//  BlackJack
//
//  Created by Flatiron School on 6/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISBlackjackPlayer : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* cardsInHand;
@property (nonatomic) BOOL aceInHand;
@property (nonatomic) BOOL blackjack;
@property (nonatomic) BOOL busted;
@property (nonatomic) BOOL stayed;
@property (nonatomic) NSUInteger handscore;
@property (nonatomic) NSUInteger wins;
@property (nonatomic) NSUInteger losses;

-(instancetype)init;
-(instancetype)initWithName:(NSString*)name;
-(void)resetForNewGame;
-(void)acceptCard: (FISCard*)card;
-(BOOL)shouldHit;

@end
