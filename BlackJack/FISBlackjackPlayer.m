//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Flatiron School on 6/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer


//default initializer
-(instancetype)init
{
    self = [self initWithName:@""];
    return self;
}
//designated initializer
-(instancetype)initWithName:(NSString*)name 
{
    self = [super init];
    if(self)
    {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc]init];
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
        _handscore = 0;
        _wins = 0;
        _losses = 0;
    }
    return self;
}
-(void)resetForNewGame
{
    [self.cardsInHand removeAllObjects];
     self.handscore = 0;
     self.aceInHand = NO;
     self.stayed = NO;
     self.blackjack = NO;
     self.busted = NO;
    
}
//Done with method, make sure to always read the instructions very carefully!
-(void)acceptCard: (FISCard*)card
{
    //first step
    [self.cardsInHand addObject:card];
        self.handscore += card.cardValue;
    
    //second step
    for(FISCard* ace in self.cardsInHand)
    {
        if([ace.rank isEqualToString:@"A"])
        {
            self.aceInHand = YES;
        }
    }
    //third step
    if(self.handscore  <= 11 && self.aceInHand)
    {
        self.handscore +=10;
    }
    //Blackjack condition 
    if([self.cardsInHand count]== 2 && self.handscore == 21)
    {
        self.blackjack = YES;
    }
    //busted condition
    if (self.handscore > 21)
    {
        self.busted = YES;
    }
}
//done, make sure to carefully read the instructions
-(BOOL)shouldHit
{
    if(self.handscore > 17)
    {
        self.stayed = YES;
        return NO;
    }
    else {
    
        return YES;
    }
}

-(NSString*)description
{
    
    NSString *newString = [NSString stringWithFormat:@"FISBlackjackPlayer:\n name: %@\n cards: %@\n handscore: %lu\n ace in hand: %d\n stayed: %d\n blackjack: %d busted: %d wins: %lu losses: %lu",  self.name, self.cardsInHand, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
    
//    NSString *firstName = @"Sara";
//    NSString *lastName = @"Ahmad";
//    
//    NSString *fullName = [NSString stringWithFormat:@"My name is %@\n %@",firstName, lastName];
//    
    return newString;
}

@end
