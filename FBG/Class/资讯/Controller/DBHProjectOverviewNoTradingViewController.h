//
//  DBHProjectOverviewNoTradingViewController.h
//  FBG
//
//  Created by 邓毕华 on 2018/1/30.
//  Copyright © 2018年 ButtonRoot. All rights reserved.
//

#import "DBHBaseViewController.h"

@class DBHProjectDetailInformationModelDataBase;

@interface DBHProjectOverviewNoTradingViewController : DBHBaseViewController

/**
 项目信息
 */
@property (nonatomic, strong) DBHProjectDetailInformationModelDataBase *projectDetailModel;

@end
