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


- (instancetype)initWithBaseURL: baseURL{
    self = [super init];
    if(self){
        _baseURL = baseURL;
    }
    return self;
}


- (void) fetchPlanetsData{
    
    //1.Build URL
    
    //2.URL Session
    
}

@end
