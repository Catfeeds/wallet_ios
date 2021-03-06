//
//  DBHSetNicknameViewController.m
//  FBG
//
//  Created by 邓毕华 on 2018/1/23.
//  Copyright © 2018年 ButtonRoot. All rights reserved.
//

#import "DBHSetNicknameViewController.h"

#import "DBHSetNicknameTableViewCell.h"

static NSString *const kDBHSetNicknameTableViewCellIdentifier = @"kDBHSetNicknameTableViewCellIdentifier";

@interface DBHSetNicknameViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DBHSetNicknameViewController

#pragma mark ------ Lifecycle ------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = DBHGetStringWithKeyFromTable(@"Set a Nickname", nil);
    self.view.backgroundColor = COLORFROM16(0xF8F8F8, 1);
    
    [self setUI];
}

#pragma mark ------ UI ------
- (void)setUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", nil) style:UIBarButtonItemStylePlain target:self action:@selector(respondsToSaveBarButtonItem)];
    
    [self.view addSubview:self.tableView];
    
    WEAKSELF
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.view);
        make.center.equalTo(weakSelf.view);
    }];
}

#pragma mark ------ UITableViewDataSource ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBHSetNicknameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDBHSetNicknameTableViewCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark ------ UITableViewDelegate ------
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTOLAYOUTSIZE(11.5);
}

#pragma mark ------ Data ------
/**
 修改昵称
 */
- (void)updateNickname {
    DBHSetNicknameTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSDictionary *paramters = @{@"img":[UserSignData share].user.img,
                                @"name":cell.nicknameTextField.text};
    WEAKSELF
    [PPNetworkHelper PUT:@"user" baseUrlType:3 parameters:paramters hudString:[NSString stringWithFormat:@"%@...", NSLocalizedString(@"Commit", nil)] success:^(id responseObject) {
        [UserSignData share].user.nickname = responseObject[@"name"];
        [LCProgressHUD showSuccess:NSLocalizedString(@"Change Success", nil)];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failure:^(NSString *error) {
        [LCProgressHUD showFailure:error];
    }];
}

#pragma mark ------ Event Responds ------
/**
 保存
 */
- (void)respondsToSaveBarButtonItem {
    DBHSetNicknameTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if (!cell.nicknameTextField.text.length) {
        [LCProgressHUD showFailure:NSLocalizedString(@"Please enter your nickname", nil)];
        
        return;
    }
    if (![NSString isNickName:cell.nicknameTextField.text]){
        [LCProgressHUD showFailure:NSLocalizedString(@"Please enter a nickname of 2~12 non-special characters", nil)];
        return;
    }
    
    [self updateNickname];
}

#pragma mark ------ Getters And Setters ------
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.rowHeight = AUTOLAYOUTSIZE(50.5);
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[DBHSetNicknameTableViewCell class] forCellReuseIdentifier:kDBHSetNicknameTableViewCellIdentifier];
    }
    return _tableView;
}

@end
