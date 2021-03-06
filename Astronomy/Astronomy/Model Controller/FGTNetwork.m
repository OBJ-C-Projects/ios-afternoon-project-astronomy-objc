//
//  FGTNetwork.m
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import "FGTNetwork.h"

//Import Swift code
#import "Astronomy-Swift.h"

@implementation FGTNetwork


- (void) fetchPlanetsPhoto:(NSString *)rover sol:(int)sol completion:(void (^)(NSArray<Planet *> *photos, NSError *error))completion {
    
    //1.Build URL
    NSString *baseURL = @"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
    NSString *keyValue = @"jrVEkWbxdUnM3zWk4ekDYlmvsyqQYOjEP4KCgsQn";
    NSURLComponents *components = [NSURLComponents  componentsWithString:baseURL];
    
    //Create query items
    NSURLQueryItem *key = [NSURLQueryItem queryItemWithName:@"api_key" value:keyValue];
    
    NSURLQueryItem *onSol = [NSURLQueryItem queryItemWithName:@"sol" value:[NSString stringWithFormat:@"%d",sol]];
   
    //Add query items to array
    components.queryItems = @[onSol,key];
    
    //Complete∫ URL
    NSURL *url = components.URL;
    
    //2.URL Session
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //Error  handling
        if (error){
            NSLog(@"Error during URL session: %@", error);
            completion(nil,error);
            return;
        }
        
        if(!data){
            NSLog(@"No data returned from URL Session");
            return;
        }
        
        //NSLog(@"Finished fetching data");
        //JSON parsing
//        NSString *dummyData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"Data: %@",dummyData);
        
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"Json error: %@", jsonError);
            completion(nil,jsonError);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]){
            NSLog(@"Json not formatted as expected");
            return;
        }
        
        NSDictionary *resultArray = json[@"photos"];
        
        NSMutableArray *photosArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in resultArray) {
//            [self.photosArray addObject: [[Planet alloc] initWithDictionary: dict]];
             [photosArray addObject: [[Planet alloc] initWithDictionary: dict]];
        }
      
        completion(photosArray,nil);
        
    }]resume];
}



@end
