//
//  main.m
//  Threelow
//
//  Created by Anthony Tulai on 2016-01-13.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
   
    Dice *dice1 = [[Dice alloc] init];
    Dice *dice2 = [[Dice alloc] init];
    Dice *dice3 = [[Dice alloc] init];
    Dice *dice4 = [[Dice alloc] init];
    Dice *dice5 = [[Dice alloc] init];
    
    NSLog(@"%@ %@ %@ %@ %@", dice1.diceValue, dice2.diceValue, dice3.diceValue, dice4.diceValue, dice5.diceValue);

    return 0;
}
