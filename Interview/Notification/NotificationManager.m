//
//  NotificationManager.m
//  Interview
//
//  Created by LuckyXYJ on 2025/7/1.
//

#import "NotificationManager.h"

@interface NotificationManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *observers;

@end

@implementation NotificationManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object {
    if (!name || !observer || !selector) {
        return;
    }
    [NSPointerArray weakObjectsPointerArray];
    // Create a notification name if it doesn't exist
    if (!self.observers[name]) {
        self.observers[name] = [NSMutableArray array];
    }
    NSNotificationQueue *queue = [NSNotificationQueue defaultQueue];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:name object:object queue:nil usingBlock:^(NSNotification * _Nonnull notification) {
        
    }];
     
    
}


@end
