//
//  DBHProjectHomeTypeOneTableViewCell.h
//  FBG
//
//  Created by 邓毕华 on 2018/1/26.
//  Copyright © 2018年 ButtonRoot. All rights reserved.
//

#import "DBHBaseTableViewCell.h"

@class DBHInformationModelData;

@interface DBHProjectHomeTypeOneTableViewCell : DBHBaseTableViewCell

/**
 项目信息
 */
@property (nonatomic, strong) DBHInformationModelData *projectModel;

@end
