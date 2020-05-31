//
//  FGTNetwork.h
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Planet;

NS_ASSUME_NONNULL_BEGIN

//Rename for swift acces 
NS_SWIFT_NAME(Network)
@interface FGTNetwork : NSObject

//Methods
- (void) fetchPlanetsPhoto:(NSString *)rover completion:(void (^)(NSArray<Planet *> *photos, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
