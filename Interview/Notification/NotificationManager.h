//
//  NotificationManager.h
//  Interview
//
//  Created by LuckyXYJ on 2025/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NotificationManager : NSObject

- (void)addObserverForName:(NSString *)name object:(nullable id)object usingBlock:(void (^)(NSNotification *notification))block;
                     
- (void)removeObserverForName:(NSString *)name object:(nullable id)object;

@end

NS_ASSUME_NONNULL_END
