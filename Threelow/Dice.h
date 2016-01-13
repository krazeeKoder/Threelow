//
//  Dice.h
//  Threelow
//
//  Created by Anthony Tulai on 2016-01-13.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic, strong) NSString *diceValue;
@property (nonatomic, assign) bool held;

-(NSString *) rollDice;
-(void) holdDice;
-(void) unHoldDice;

-(id) init;

@end
