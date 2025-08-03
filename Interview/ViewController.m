//
//  ViewController.m
//  Interview
//
//  Created by LuckyXYJ on 2025/6/13.
//

#import "ViewController.h"
#import "CustomCardView.h"

@interface ViewController ()

@property (nonatomic, strong) CustomCardView *customCardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(100, 400, 200, 200) style:UITableViewStylePlain];
    
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [btn addGestureRecognizer: tapGesture];
    
    [self.view addSubview:btn];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    self.customCardView = [[CustomCardView alloc] initWithFrame:CGRectMake((screenWidth - 300)/2, (screenHeight - 300)/2, 300, 300)];
    [self.view addSubview:self.customCardView];
 
    // 创建四个卡片
    UIView *card1 = [self createCardWithText:@"1" frame:CGRectMake(20, 80, 150, 100)];
    UIView *card2 = [self createCardWithText:@"2" frame:CGRectMake(190, 80, 70, 70)];
    UIView *card3 = [self createCardWithText:@"3" frame:CGRectMake(20, 200, 70, 70)];
    UIView *card4 = [self createCardWithText:@"4" frame:CGRectMake(100, 200, 70, 70)];
 
    // 启动动画
    [self.customCardView startAnimationWithCards:@[card1, card2, card3, card4]];
}
 
- (UIView *)createCardWithText:(NSString *)text frame:(CGRect)frame {
    UIView *card = [[UIView alloc] initWithFrame:frame];
    card.backgroundColor = [UIColor blueColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:card.bounds];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:35];
    
    [card addSubview:label];
    return card;
}

- (void)clickButton:(UIButton *)sender {
    NSLog(@"Button clicked");
    
    [UIView animateWithDuration:0.5 animations:^{

        self.view.backgroundColor = UIColor.redColor;
    } completion:^(BOOL finished) {
        NSLog(@"Button frame changed");
        self.view.backgroundColor = UIColor.clearColor;
    }];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture {
    NSLog(@"View tapped");
}


@end
