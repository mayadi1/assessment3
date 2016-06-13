//
//  CatsViewController.m
//  Assessment3
//
//  Created by Ben Bueltmann on 1/25/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//

#import "CatsViewController.h"
#import "AddCatViewController.h"
#import "Cat.h"

@interface CatsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *CatsTableView;
@property NSArray *cats;

@end

@implementation CatsViewController
-(void)viewWillAppear:(BOOL)animated{
     [self loadCats];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Cats";
    [self loadCats];
}

-(void) loadCats {
    
    self.cats = [self.passedOwner.cat allObjects];
    
    [self.CatsTableView reloadData];
}

#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //TODO: UPDATE THIS ACCORDINGLY
    return self.cats.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CatCell"];
    Cat *cat = [self.cats objectAtIndex:indexPath.row];
    cell.textLabel.text = cat.name;
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    AddCatViewController *dvc = segue.destinationViewController;
   
    Owner *readerName = self.passedOwner;
    
    dvc.passedOwner  = readerName;
    
}


@end
