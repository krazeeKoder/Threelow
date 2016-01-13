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
    
    
    NSMutableArray *diceCollection = [[NSMutableArray alloc] initWithObjects: dice1, dice2, dice3, dice4, dice5, nil];
    
    bool runLoop = YES;
    NSLog(@"Welcome to threelow roller!! To roll the dice type low and to exit type anything else!");
    while (runLoop) {
        
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
            bool makingHoldDecision = YES;
            while (makingHoldDecision) {
                NSLog(@"%@ %@ %@ %@ %@", dice1.diceValue, dice2.diceValue, dice3.diceValue, dice4.diceValue, dice5.diceValue);
                NSLog(@"Enter the index of a dice you would like to hold or unhold, if you are done, type low to re-roll and anything else to exit");
                char choice[255];
                fgets(choice,255,stdin);
                NSString *holdChoice = [NSString stringWithUTF8String:choice];
                holdChoice = [holdChoice stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
                
                if ([holdChoice rangeOfCharacterFromSet:nonNumberSet].location != NSNotFound) {
                    if ([holdChoice isEqual: @"low"]) {
                        makingHoldDecision = NO;
                        for (Dice *dice in diceCollection) {
                            if (dice.held == NO) {
                                dice.diceValue = [dice rollDice];
                            }
                            else {
                                [dice unHoldDice];
                            }
                        }
                        NSLog(@"%@ %@ %@ %@ %@", dice1.diceValue, dice2.diceValue, dice3.diceValue, dice4.diceValue, dice5.diceValue);
                        NSLog(@"Enter the index of a dice you would like to hold or unhold, if you are done, type low to re-roll and anything else to exit");
                    }
                    else {
                        makingHoldDecision = NO;
                        runLoop = NO;
                    }
                }
                else
                {
                    NSInteger holdIndex = [holdChoice intValue];
                    if (holdIndex > 5 || holdIndex < 1) {
                        NSLog(@"Not a valid Choice, program will end");
                        makingHoldDecision = NO;
                        runLoop = NO;
                    }
                    else {
                        Dice *diceSelected =[diceCollection objectAtIndex:holdIndex - 1];
                        if (diceSelected.held == NO) {
                            [diceSelected holdDice];
                        }
                        else {
                            [diceSelected unHoldDice];
                        }
                    }
                }
            }
        }
        else {
            runLoop = NO;
        }
    }
    return 0;
}
