//
//  FISBlackjackGame.m
//  
//
//  Created by Flatiron School on 6/21/16.
//
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame
//Done 
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _deck = [[FISCardDeck alloc]init];
        _house = [[FISBlackjackPlayer alloc]initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc]initWithName:@"Player"];
    }
    return self;
}
-(void)playBlackjack
{
    [self.deck resetDeck]; 
    [self dealNewRound];
    for(NSUInteger i = 0; i < 3; i++)
    {
        [self processPlayerTurn];
        [self processHouseTurn];
        if(self.player.busted || self.house.busted)
        {
            break; 
        }
    
    }
    [self incrementWinsAndLossesForHouseWins:[self houseWins]];
    NSLog(@"Player info:%@  House infor:%@", self.player.description, self.house.description); 
}
//Done
-(void)dealNewRound
{
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse]; 
}
//Done
-(void)dealCardToPlayer
{
    FISCard *newCard = [self.deck drawNextCard];
    [self.player acceptCard:newCard];
    
}
//Done
-(void)dealCardToHouse
{
    FISCard *newCard = [self.deck drawNextCard];
    [self.house acceptCard:newCard];
}
//Done
-(void)processPlayerTurn
{
    if(!(self.player.busted) && !(self.player.stayed))
    {
        if ([self.player shouldHit])
    {
        [self dealCardToPlayer];
    }
    }
}
//Done, you want a Hit! and you want to make sure that you don't have a bust AND don't have a stay
-(void)processHouseTurn
{
    if (!(self.house.busted) && !(self.house.stayed) && [self.house shouldHit]){
    
        [self dealCardToHouse];
   
    }
}
//Done
-(BOOL)houseWins
{
    
    if (self.house.busted || (self.player.blackjack && self.house.blackjack)) {
        return NO;
    }
    
    if(self.player.busted || self.house.handscore >= self.player.handscore)
    {
        return YES;
    }
    else if(self.house.busted || self.player.handscore > self.house.handscore)
    {
        NSLog(@"else if coming true");

        return NO;
    }
    NSLog(@"nothing is coming true");

    return YES;
}
//Done 
-(void)incrementWinsAndLossesForHouseWins: (BOOL)houseWins
{
    if (houseWins)
    {
        self.house.wins++;
        self.player.losses++;
    }
    else
    {
        self.house.losses++; 
        self.player.wins++;
    }
}

@end
