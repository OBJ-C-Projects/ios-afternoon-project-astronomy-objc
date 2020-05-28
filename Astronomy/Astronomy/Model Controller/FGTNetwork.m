//
//  FGTNetwork.m
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import "FGTNetwork.h"


@implementation FGTNetwork

- (void) fetchPlanetsData{
    
    //1.Build URL
    NSString *baseURL = @"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
    NSString *keyValue = @"jrVEkWbxdUnM3zWk4ekDYlmvsyqQYOjEP4KCgsQn";
    NSURLComponents *components = [NSURLComponents  componentsWithString:baseURL];
    
    //Create query items
    NSURLQueryItem *key = [NSURLQueryItem queryItemWithName:@"api_key" value:keyValue];
    
    NSURLQueryItem *sol = [NSURLQueryItem queryItemWithName:@"sol" value:@"1000"];
    //Add query items to array
    components.queryItems = @[sol,key];
    
    //Complete∫ URL
    NSURL *url = components.URL;
    
    //2.URL Session
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //Error  handling
        if (error){
            NSLog(@"Error during URL session%@", error);
            return;
        }
        
        if(!data){
            NSLog(@"No data returned from URL Session");
            return;
        }
        
        NSLog(@"Finished fetching data");
        //JSON parsing
        NSString *dummyData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Data: %@",dummyData);
        
        
    }]resume];
}

@end
