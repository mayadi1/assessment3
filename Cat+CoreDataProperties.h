//
//  Cat+CoreDataProperties.h
//  Assessment3
//
//  Created by Mohamed Ayadi on 6/10/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Cat.h"

NS_ASSUME_NONNULL_BEGIN

@interface Cat (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *breed;
@property (nullable, nonatomic, retain) NSString *color;
@property (nullable, nonatomic, retain) NSManagedObject *owner;

@end

NS_ASSUME_NONNULL_END
