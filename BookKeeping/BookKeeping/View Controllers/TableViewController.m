//
//  TableViewController.m
//  BookKeeping
//
//  Created by JunQiu on 2018/5/22.
//  Copyright © 2018 JunQiu. All rights reserved.
//

#import "TableViewController.h"
#import "customCell.h"
#import "Data.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize mainDelegate;

#pragma mark Table Methods
/* Nums of records -> rows */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mainDelegate.record count];
}

/* Height for row. */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

/* Comments */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"Cell";
    
    customCell *cell = (customCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[customCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    // List cell
    NSInteger row = indexPath.row;
    Data *d = [mainDelegate.record objectAtIndex:row];
    cell.primaryLabel.text = d.title;
    cell.secondaryLabel.text = [NSString stringWithFormat:@"%.2f", d.amount];
    cell.descriptionLabel.text = d.description;
    
// -- Debug info ---------------------------------------------
    // NSLog(@"%@, %@, %@", cell.primaryLabel.text, cell.secondaryLabel.text, cell.descriptionLabel.text);
// -- Debug info ---------------------------------------------

    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


#pragma mark View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate readDataFromDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
