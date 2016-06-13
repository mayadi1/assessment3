//
//  Owner+CoreDataProperties.h
//  Assessment3
//
//  Created by Mohamed Ayadi on 6/10/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Owner.h"

NS_ASSUME_NONNULL_BEGIN

@interface Owner (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Cat *> *cat;

@end

@interface Owner (CoreDataGeneratedAccessors)

- (void)addCatObject:(Cat *)value;
- (void)removeCatObject:(Cat *)value;
- (void)addCat:(NSSet<Cat *> *)values;
- (void)removeCat:(NSSet<Cat *> *)values;

@end

NS_ASSUME_NONNULL_END
