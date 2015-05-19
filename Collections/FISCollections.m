//
//  FISCollections.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCollections.h"

@implementation FISCollections

//define methods here
- (NSArray *)sortArrayAsc:(NSArray *)array
{
    NSSortDescriptor *AtoZDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    NSArray *sortedAscendingArray = [array sortedArrayUsingDescriptors:@[AtoZDescriptor]];
    return sortedAscendingArray;
}

- (NSArray *)sortArrayDesc:(NSArray *)array
{
    NSSortDescriptor *ZtoADescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:NO];
    NSArray *sortedDescendingArray = [array sortedArrayUsingDescriptors:@[ZtoADescriptor]];
    return sortedDescendingArray;
}

- (NSArray *)swapElements:(NSArray *)array
{
    NSMutableArray *mutableArray = [array mutableCopy];
    [mutableArray exchangeObjectAtIndex:1 withObjectAtIndex:2];
    return [mutableArray copy];
}

- (NSArray *)reverseArray:(NSArray *)array
{
    return [array reverseObjectEnumerator].allObjects;
}

- (NSArray *)keshaMaker:(NSArray *)array
{
    NSRange range = NSMakeRange(2, 1);
    NSMutableArray *keshaArray = [@[] mutableCopy];
    for (NSString *string in array) {
        [keshaArray addObject:[string stringByReplacingCharactersInRange:range withString:@"$"]];
    }
    return [keshaArray copy];
}

- (NSDictionary *)greaterAndLessThan10:(NSArray *)array
{
    NSPredicate *greaterThan10Predicate = [NSPredicate predicateWithFormat:@"self > %@", @10];
    NSPredicate *lessThan10Predicate = [NSPredicate predicateWithFormat:@"self < %@", @10];
    NSArray *greaterThan10Array = [array filteredArrayUsingPredicate:greaterThan10Predicate];
    NSArray *lessThan10Array = [array filteredArrayUsingPredicate:lessThan10Predicate];
    return @{@"greater_than_10":greaterThan10Array, @"less_than_10":lessThan10Array};
}

- (NSArray *)findWinners:(NSDictionary *)dictionary
{
    NSMutableArray *winnersArray = [@[] mutableCopy];
    for (NSString *name in dictionary) {
        if ([dictionary[name] isEqualToString:@"winner"]) {
            [winnersArray addObject:name];
        }
    }
    return [winnersArray copy];
}

- (NSArray *)findA:(NSArray *)array
{
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] %@", @"a"];
    NSArray *beginsWithAArray = [array filteredArrayUsingPredicate:beginsWithAPredicate];
    return beginsWithAArray;
}

- (NSInteger)sumArray:(NSArray *)array
{
    NSInteger sum = 0;
    for (NSNumber *number in array) {
        sum+= [number integerValue];
    }
    return sum;
}

- (NSArray *)addS:(NSArray *)array
{
    NSMutableArray *addSarray = [@[] mutableCopy];
    for (NSInteger i=0; i<[array count]; i++) {
        if (i == 1) {
            [addSarray addObject:array[i]];
        } else {
            [addSarray addObject:[NSString stringWithFormat:@"%@s", array[i]]];
        }
    }
    return [addSarray copy];
}

- (NSDictionary *)countWordsInStory:(NSString *)string
{
    NSArray *wordsArray = [string componentsSeparatedByString:@" "];
    NSCountedSet *wordsSet = [[NSCountedSet alloc] initWithArray:wordsArray];
    NSMutableDictionary *wordsDictionary = [@{} mutableCopy];
    for (NSString *string in wordsSet) {
        wordsDictionary[string] = @([wordsSet countForObject:string]);
    }
    return [wordsDictionary copy];
}

- (NSDictionary *)organizeSongsByArtist:(NSArray *)array
{
    NSMutableDictionary *artistDictionary = [@{} mutableCopy];
    for (NSString *string in array) {
        NSArray *artistAndSongArray = [string componentsSeparatedByString:@" - "];
        NSString *artist = [artistAndSongArray firstObject];
        NSString *song = [artistAndSongArray lastObject];
        
        if (artistDictionary[artist]) {
            NSMutableArray *songsArray = [artistDictionary[artist] mutableCopy];
            [songsArray addObject:song];
            artistDictionary[artist] = [songsArray copy];
        } else {
            artistDictionary[artist] = @[song];
        }
    }
    return [artistDictionary copy];
}

@end
