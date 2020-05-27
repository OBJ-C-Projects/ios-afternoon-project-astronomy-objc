//
//  FGTNetwork.h
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface FGTNetwork : NSObject

//Properties
@property (nonatomic) NSURL *baseURL;

- (instancetype)initWithBaseURL: (NSURL *) baseURL;


//Methods
- (void) fetchPlanetsData;

@end

NS_ASSUME_NONNULL_END
