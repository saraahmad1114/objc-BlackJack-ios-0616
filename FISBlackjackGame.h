//
//  FISBlackjackGame.h
//  
//
//  Created by Flatiron School on 6/21/16.
//
//

#import <Foundation/Foundation.h>
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"

@interface FISBlackjackGame : NSObject

@property (nonatomic, strong) FISCardDeck* deck;
@property (nonatomic, strong) FISBlackjackPlayer* house;
@property (nonatomic, strong) FISBlackjackPlayer* player;

-(instancetype)init; 
-(void)playBlackjack;
-(void)dealNewRound;
-(void)dealCardToPlayer;
-(void)dealCardToHouse;
-(void)processPlayerTurn;
-(void)processHouseTurn;
-(BOOL)houseWins;
-(void)incrementWinsAndLossesForHouseWins: (BOOL)houseWins;


@end
