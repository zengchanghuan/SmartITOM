//
//  StackTabBarController.h
//

#import <UIKit/UIKit.h>
#import "StackTabBar.h"
#import "UIBarButtonItem+Stack.h"


@protocol StackTabBarControllerDelegate;

@interface StackTabBarController : UIViewController <UINavigationControllerDelegate, StackTabBarDelegate, UITabBarControllerDelegate>

//@property (nonatomic, assign) NSUInteger selectedDidIndex;
@property (nonatomic, strong) UIViewController *selectedViewController;
@property (nonatomic, strong, readonly) StackTabBar *tabBar;

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) id<StackTabBarControllerDelegate> delegate;
@property (nonatomic, strong) UIViewController *detailController;

@property (nonatomic,strong) UIViewController *thirdController;
@property (nonatomic, strong) UIImageView *imageViewLeftShadow;
@property (nonatomic, strong) UIImageView *imageViewRightShadow;


-(void)setBadgeValue:(NSString *)value index:(int)index;

-(void)setSelectedIndex:(NSUInteger)index;

// 详细视图的
-(void)showDetailController:(UIViewController *)viewController animated:(BOOL)animated;
-(void)hideDetailController:(BOOL)animated;
-(void)hideDetailControllerBackGround;

// 动画结束
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

//
-(void)showSimpleDetailController:(UIViewController *)viewController animated:(BOOL)animated;

// 详细视图从左向右的滑动手势
-(void)detailSwipeFromLeft;

// 刷新当前的视图
-(void)freshCurrentMasterViewController;

@end


/// StackTabBarControllerDelegate

@protocol StackTabBarControllerDelegate <NSObject>

@optional

- (void)stackTabBarController:(StackTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
- (BOOL)stackTabBarController:(StackTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;

@end


/// ControllerInTabbarDelegate

@protocol ControllerInTabbarDelegate

@optional

// 当前视图滚到最前前面
-(void)viewScrollToTop;

// 强制刷新视图
-(void)viewFreshData;

// 取消选择
-(void)viewDeselectCurrentSelect;

@end
