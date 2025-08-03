//
//  Teacher.h
//  Interview
//
//  Created by LuckyXYJ on 2025/7/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NSObject

// 返回教学科目的block属性
@property (nonatomic, copy) NSString *(^subjectBlock)(void);

// 科目
@property (nonatomic, copy) NSString *subject;

@end

NS_ASSUME_NONNULL_END
