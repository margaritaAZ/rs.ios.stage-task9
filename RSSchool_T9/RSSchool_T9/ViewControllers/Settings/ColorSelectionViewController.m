//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorSelectionViewController.h"

@interface ColorSelectionViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *strokeColors;

@end

@implementation ColorSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.strokeColors = @[@"#BE2813", @"#3802DA", @"#467C24", @"#808080", @"#8E5AF7", @"#F07F5A", @"#F3AF22", @"#3DACF7", @"#E87AA4", @"#0F2E3F", @"#213711", @"#511307", @"#92003B"];
    
    [self setupTableView];
}

- (void) setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

// MARK: UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.strokeColors.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    NSString *color = self.strokeColors[indexPath.row];
    cell.textLabel.text = [color lowercaseString];
    cell.textLabel.textColor = [UIColor colorNamed: color];
    cell.backgroundColor = [UIColor colorWithRed:0.976 green:0.976 blue:0.976 alpha:1];
    cell.tintColor = UIColor.redColor;
    if ([color isEqual:self.selectedColor]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

// MARK: UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedColor = [[tableView cellForRowAtIndexPath:indexPath].textLabel.text uppercaseString];
    [tableView reloadData];
    [self.delegate colorDidSelected:self.selectedColor];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


@end
