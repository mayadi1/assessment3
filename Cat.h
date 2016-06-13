//
//  Cat.h
//  Assessment3
//
//  Created by Mohamed Ayadi on 6/10/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cat : NSManagedObject
+ (Cat *)fetchCatWithName:(NSString *)name;

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Cat+CoreDataProperties.h"
