//
//  ViewController.m
//  Assessment3
//
//  Created by Ben Bueltmann on 1/25/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Owner.h"
#import "CatsViewController.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSManagedObjectContext *moc;
@property BOOL checkedIfEverFanned;
@property NSString *valueToSave;
@property NSString *valueToSave2;




@property  NSArray *characters;
@property NSMutableArray  *array2;

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated{
    NSString *savedValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"preferenceName"];
    //self.valueToSave2= [[NSUserDefaults standardUserDefaults] stringForKey:@"preferenceName2"];
    NSLog(@"saved value: %@",savedValue);
    
    if([savedValue isEqualToString:@"1"]){
        self.navigationController.navigationBar.tintColor = [UIColor purpleColor];}
    if([savedValue isEqualToString:@"2"]){
        self.navigationController.navigationBar.tintColor = [UIColor blueColor];}
    if([savedValue isEqualToString:@"3"]){
        self.navigationController.navigationBar.tintColor = [UIColor orangeColor];}
    if([savedValue isEqualToString:@"4"]){
        self.navigationController.navigationBar.tintColor = [UIColor greenColor];}
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.valueToSave2= [[NSUserDefaults standardUserDefaults] stringForKey:@"preferenceName2"];
        self.characters=[NSArray new];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"catowners" ofType:@"plist"];
    
    // Build the array from the plist
    self.array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
  

    if([self.valueToSave2 length] == 0){
        
        
        [self load];
        
        self.valueToSave2 =@"dfghjkl";
        [[NSUserDefaults standardUserDefaults] setObject:self.valueToSave2 forKey:@"preferenceName2"];
    }
 
    
    self.title = @"Cat Owners";
    [self Fetch];
}

-(void)load{
    
    for (NSDictionary *dict in _array2) {
        NSLog(@"%@", [dict objectForKey:@"name"]);
        Owner *character = [NSEntityDescription insertNewObjectForEntityForName:@"Owner" inManagedObjectContext:self.moc];
        character.name = [dict objectForKey:@"name"];
        
    }
}
-(void)Fetch{
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Owner"];
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    request.sortDescriptors = @[sortByName];
    
    NSError *error;
    //    self.friends = [self.moc executeRequest:request error:&error];
    self.characters= [self.moc executeFetchRequest:request error:&error];
    
    if(error==nil) {
        [self.tableView reloadData];
    } else {
        NSLog(@"ERROR: %@", error);
    }

}

#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //TODO: UPDATE THIS ACCORDINGLY
    return self.characters.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CellID"];
    
    
    
   
    
    
    Owner *character = [self.characters objectAtIndex:indexPath.row];
    
  
    cell.textLabel.text = character.name;
    
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    CatsViewController *dvc = segue.destinationViewController;
    NSIndexPath *i = [self.tableView indexPathForSelectedRow];
    
    NSLog(@"%ld",i.row);
    Owner *readerName = self.characters[i.row];
    
    dvc.passedOwner  = readerName;
    
}


//METHOD FOR PRESENTING USER'S COLOR PREFERENCE
- (IBAction)onColorButtonTapped:(UIBarButtonItem *)sender
{
    //TODO: SAVE USER'S DEFAULT COLOR PREFERENCE USING THE CONDITIONAL BELOW
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose a default color!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *purple = [UIAlertAction actionWithTitle:@"Purple" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
        self.valueToSave =@"1";
        [[NSUserDefaults standardUserDefaults] setObject:self.valueToSave forKey:@"preferenceName"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    UIAlertAction *blue = [UIAlertAction actionWithTitle:@"Blue" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.navigationController.navigationBar.tintColor = [UIColor blueColor];
        self.valueToSave =@"2";
        [[NSUserDefaults standardUserDefaults] setObject:self.valueToSave forKey:@"preferenceName"];
    }];
    UIAlertAction *orange = [UIAlertAction actionWithTitle:@"Orange" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
        self.valueToSave =@"3";
        [[NSUserDefaults standardUserDefaults] setObject:self.valueToSave forKey:@"preferenceName"];
    }];
    UIAlertAction *green = [UIAlertAction actionWithTitle:@"Green" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.navigationController.navigationBar.tintColor = [UIColor greenColor];
        self.valueToSave =@"4";
        [[NSUserDefaults standardUserDefaults] setObject:self.valueToSave forKey:@"preferenceName"];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:purple];
    [alertController addAction:blue];
    [alertController addAction:orange];
    [alertController addAction:green];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:true completion:^{
        
    }];
    
}

@end
