//
//  FGTNetwork.m
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import "FGTNetwork.h"


@implementation FGTNetwork

//NasaKey: jrVEkWbxdUnM3zWk4ekDYlmvsyqQYOjEP4KCgsQn
//base url: https://api.nasa.gov/planetary/apod?api_key=jrVEkWbxdUnM3zWk4ekDYlmvsyqQYOjEP4KCgsQn


- (void) fetchPlanetsData{
    
    //1.Build URL
    NSString *baseURL = @"https://api.nasa.gov/planetary/apod?api";
    NSString *keyValue = @"jrVEkWbxdUnM3zWk4ekDYlmvsyqQYOjEP4KCgsQn";
    NSURLComponents *components = [NSURLComponents  componentsWithString:baseURL];
    
    //Create query items
    NSURLQueryItem *key = [NSURLQueryItem queryItemWithName:@"key" value:keyValue];
    
    //Add query items to array
    components.queryItems = @[key];
    
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
        
        //JSON parsing
        
        
        
    }]resume];
}

@end
