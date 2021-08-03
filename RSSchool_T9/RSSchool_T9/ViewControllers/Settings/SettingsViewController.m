//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Маргарита Жучик
// On: 28.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "ColorSelectionViewController.h"
#import "ColorSelectionViewControllerDelegate.h"
#import "RSSchool_T9-Swift.h"

@interface SettingsViewController () <UITableViewDataSource, UITableViewDelegate, ColorSelectionViewControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isDrawStories;
@property (nonatomic, copy) NSString *strokeColor;
@property (nonatomic, strong) ColorSelectionViewController *colorsVC;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Settings";
    
    // set default values
    self.isDrawStories = YES;
    self.strokeColor = @"#E87AA4";
    
    [self setupTableView];
    
    self.colorsVC = [ColorSelectionViewController new];
    self.colorsVC.selectedColor = self.strokeColor;
    self.colorsVC.delegate = self;
}

- (void) setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.scrollEnabled = NO;
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
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Draw stories";
        UISwitch *switchButton = [UISwitch new];
        switchButton.on = self.isDrawStories;
        [switchButton addTarget:self action:@selector(updateIsDrawStories:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = switchButton;
    } else if (indexPath.row == 1) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.text = @"Stroke color";
        cell.detailTextLabel.text = [self.strokeColor lowercaseString];
        cell.detailTextLabel.textColor = [UIColor colorNamed:self.strokeColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.backgroundColor = [UIColor colorWithRed:0.976 green:0.976 blue:0.976 alpha:1];
    return cell;
}

- (void) updateIsDrawStories: (UISwitch *) sender {
    self.isDrawStories = sender.on;
    StoryImageView.isAnimated = self.isDrawStories;
}

// MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        [self.navigationController pushViewController: self.colorsVC animated:YES];
    }
}

//MARK: ColorSelectionViewControllerDelegate
- (void) colorDidSelected: (NSString *) color {
    self.strokeColor = color;
    [self.tableView reloadData];
    
    StoryImageView.color = [UIColor colorNamed:color];
}

@end
