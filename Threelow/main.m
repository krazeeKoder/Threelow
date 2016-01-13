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
    
    bool runLoop = YES;
    
    while (runLoop) {
        NSLog(@"Welcome to threelow roller!! To roll the dice type low and to exit type anything else!");
        char userInput[255];
        fgets(userInput,255,stdin);
        NSString *userRequest = [NSString stringWithUTF8String:userInput];
        userRequest = [userRequest stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        if ([userRequest isEqual: @"low"]) {
            dice1.diceValue = [dice1 rollDice];
            dice2.diceValue = [dice2 rollDice];
            dice3.diceValue = [dice3 rollDice];
            dice4.diceValue = [dice4 rollDice];
            dice5.diceValue = [dice5 rollDice];
            NSLog(@"%@ %@ %@ %@ %@", dice1.diceValue, dice2.diceValue, dice3.diceValue, dice4.diceValue, dice5.diceValue);
        }
        else {
            runLoop = NO;
        }
    }
    return 0;
}
