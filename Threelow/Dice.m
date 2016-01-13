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
        }
        else if (rand == 2) {
            _diceValue = @"\u2681";        }
        else if (rand == 3) {
            _diceValue = @"\u2682";
        }
        else if (rand == 4) {
            _diceValue = @"\u2683";
        }
        else if (rand == 5) {
            _diceValue = @"\u2684";
        }
        else if (rand == 6) {
            _diceValue = @"\u2685";
        }
        _held = NO;
    }
    return self;
}

-(NSString *) rollDice {
    int rand = arc4random_uniform(5) +1;
    if (rand == 1) {
        return (@"\u2680");
    }
    else if (rand == 2) {
        return(@"\u2681");
    }
    else if (rand == 3) {
        return(@"\u2682");
    }
    else if (rand == 4) {
        return(@"\u2683");
    }
    else if (rand == 5) {
        return(@"\u2684");
    }
    else if (rand == 6) {
        return(@"\u2685");
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


@end
