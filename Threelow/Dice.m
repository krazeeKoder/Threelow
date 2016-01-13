//
//  Dice.m
//  Threelow
//
//  Created by Anthony Tulai on 2016-01-13.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (id)init {
    self = [super init];
    if (self) {
        int rand = arc4random_uniform(5) +1;
        
        if (rand == 1) {
            _diceValue = @"\u2680";
            _diceScore = 1;
        }
        else if (rand == 2) {
            _diceValue = @"\u2681";
            _diceScore = 2;
        }
        else if (rand == 3) {
            _diceValue = @"\u2682";
            _diceScore = 0;
        }
        else if (rand == 4) {
            _diceValue = @"\u2683";
            _diceScore = 4;
        }
        else if (rand == 5) {
            _diceValue = @"\u2684";
            _diceScore = 5;
        }
        else if (rand == 6) {
            _diceValue = @"\u2685";
            _diceScore = 6;
        }
        _held = NO;
    }
    return self;
}

-(void) rollDice{
    int rand = arc4random_uniform(5) +1;
    if (rand == 1) {
        self.diceValue = @"\u2680";
        self.diceScore = 1;
    }
    else if (rand == 2) {
        self.diceValue = @"\u2681";
        self.diceScore = 2;
    }
    else if (rand == 3) {
        self.diceValue = @"\u2682";
        self.diceScore= 0;
    }
    else if (rand == 4) {
        self.diceValue = @"\u2683";
        self.diceScore = 4;
    }
    else if (rand == 5) {
        self.diceValue = @"\u2684";
        self.diceScore = 5;
    }
    else if (rand == 6) {
        self.diceValue = @"\u2685";
        self.diceScore = 6;
    }
    else abort();
}


-(void) holdDice {
    self.held = YES;
    self.diceValue = [[@"[" stringByAppendingString:self.diceValue] stringByAppendingString:@"]"];
}

-(void) unHoldDice {
    self.held = NO;
    self.diceValue = [self.diceValue stringByReplacingOccurrencesOfString:@"[" withString:@""];
    self.diceValue = [self.diceValue stringByReplacingOccurrencesOfString:@"]" withString:@""];
}

+(int) totalScore: (NSMutableArray *)diceCollection{
    int total = 0;
    for (Dice *dice in diceCollection) {
        total = total + dice.diceScore;
    }
    return total;
}

@end
