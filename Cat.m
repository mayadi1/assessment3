//
//  Cat.m
//  Assessment3
//
//  Created by Mohamed Ayadi on 6/10/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//

#import "Cat.h"
#import "AppDelegate.h"
#import "Owner.h"
@implementation Cat

// Insert code here to add functionality to your managed object subclass
+ (Cat *)fetchCatWithName:(NSString *)name {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = appDelegate.managedObjectContext;
    
    NSError *error = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Cat"];
 
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]];
    
    Cat *cat = [((NSArray *)[moc executeFetchRequest:fetchRequest error:&error]) firstObject];
    
    if(!cat) {
        cat = [NSEntityDescription insertNewObjectForEntityForName:@"Cat" inManagedObjectContext:moc];
    }
    cat.name = name;
    
    
    return cat;
}

@end
