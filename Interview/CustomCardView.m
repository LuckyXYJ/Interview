//
//  CustomCardView.m
//  Interview
//
//  Created by LuckyXYJ on 2025/8/2.
//


#import "CustomCardView.h"

@interface CustomCardView ()

@property (nonatomic, strong) NSArray<UIView *> *cards;

@property (nonatomic, assign) CGFloat cardSpacing;
@property (nonatomic, assign) CGFloat bigWidth;
@property (nonatomic, assign) CGFloat mediumWidth;
@property (nonatomic, assign) CGFloat smallWidth;
@property (nonatomic, assign) CGFloat bigHeight;
@property (nonatomic, assign) CGFloat mediumHeight;
@property (nonatomic, assign) CGFloat smallHeight;

@property (nonatomic, assign) CGFloat animatingDuration;

@end

@implementation CustomCardView

- (void)startAnimationWithCards:(NSArray<UIView *> *)cards {
    self.cards = cards;

    // 添加子视图
    for (UIView *card in cards) {
        [self addSubview:card];
    }
    
    CGSize originalSize = self.frame.size;
    _cardSpacing = 10;
    _animatingDuration = 0.5;
    _bigWidth = (originalSize.width - _cardSpacing) * 0.6;
    _mediumWidth = (originalSize.width - _cardSpacing) * 0.4;
    _smallWidth = ((originalSize.width - _cardSpacing) * 0.4 - _cardSpacing) * 0.5;
    _bigHeight = originalSize.height;
    _mediumHeight = (originalSize.height - _cardSpacing) * 0.6;
    _smallHeight = (originalSize.height - _cardSpacing) * 0.4;
    

    self.cards[0].frame = CGRectMake(0, 0, self.bigWidth, self.bigHeight); // Card 1
    self.cards[1].frame = CGRectMake(self.bigWidth + self.cardSpacing, 0, self.mediumWidth, self.mediumHeight);
    self.cards[2].frame = CGRectMake(self.bigWidth + self.cardSpacing, self.mediumHeight + 10, self.smallWidth, self.smallHeight);
    self.cards[3].frame = CGRectMake(self.bigWidth + self.cardSpacing * 2 + self.smallWidth, self.mediumHeight + 10, self.smallWidth, self.smallHeight);
    
    // 启动动画
    [self animateToStateB];
}

- (void)animateToStateA {
    [UIView animateWithDuration:_animatingDuration animations:^{
        // 设置状态 B 动画
        self.cards[0].frame = CGRectMake(0, 0, self.bigWidth, self.bigHeight); // Card 1
        self.cards[1].frame = CGRectMake(self.bigWidth + self.cardSpacing, 0, self.mediumWidth, self.mediumHeight);
        self.cards[2].frame = CGRectMake(self.bigWidth + self.cardSpacing, self.mediumHeight + 10, self.smallWidth, self.smallHeight);
        self.cards[3].frame = CGRectMake(self.bigWidth + self.cardSpacing * 2 + self.smallWidth, self.mediumHeight + 10, self.smallWidth, self.smallHeight);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(animateToStateB) withObject:nil afterDelay:1.0];
    }];
}

- (void)animateToStateB {
    [UIView animateWithDuration:_animatingDuration animations:^{
        // 设置状态 B 动画
        self.cards[0].frame = CGRectMake(0, 0, self.mediumWidth, self.mediumHeight); // Card 1
        self.cards[1].frame = CGRectMake(self.mediumWidth + self.cardSpacing, 0, self.bigWidth, self.bigHeight); // Card 2
        self.cards[2].frame = CGRectMake(0, self.mediumHeight + self.cardSpacing, self.smallWidth, self.smallHeight); // Card 3
        self.cards[3].frame = CGRectMake(self.smallWidth + self.cardSpacing, self.mediumHeight + self.cardSpacing, self.smallWidth, self.smallHeight); // Card 4
    } completion:^(BOOL finished) {
        [self performSelector:@selector(animateToStateC) withObject:nil afterDelay:1.0];
    }];
}

- (void)animateToStateC {
    [UIView animateWithDuration:_animatingDuration animations:^{
        // 设置状态 C 动画
        self.cards[0].frame = CGRectMake(self.bigWidth + self.cardSpacing, 0, self.smallWidth, self.smallHeight);
        self.cards[1].frame = CGRectMake(self.bigWidth + self.cardSpacing * 2 + self.smallWidth, 0, self.smallWidth, self.smallHeight);
        self.cards[2].frame = CGRectMake(0, 0, self.bigWidth, self.bigHeight);
        self.cards[3].frame = CGRectMake(self.bigWidth + self.cardSpacing, self.smallHeight + self.cardSpacing, self.mediumWidth, self.mediumHeight);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(animateToStateD) withObject:nil afterDelay:1.0];
    }];
}

- (void)animateToStateD {
    [UIView animateWithDuration:_animatingDuration animations:^{
        // 设置状态 D 动画
        self.cards[0].frame = CGRectMake(0, 0, self.smallWidth, self.smallHeight);
        self.cards[1].frame = CGRectMake(self.smallWidth + self.cardSpacing, 0, self.smallWidth, self.smallHeight);
        self.cards[2].frame = CGRectMake(0, self.smallHeight + self.cardSpacing, self.mediumWidth, self.mediumHeight);
        self.cards[3].frame = CGRectMake(self.smallWidth * 2 + self.cardSpacing * 2, 0, self.bigWidth, self.bigHeight);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(animateToStateA) withObject:nil afterDelay:1.0];
    }];
}

@end

