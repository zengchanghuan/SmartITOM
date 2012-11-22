//
//  DHMainViewController.h
//  SmartITOM
//

#import <UIKit/UIKit.h>
#import "StackTabBarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "EquipmentViewController.h"
#import "AlarmViewController.h"
@interface DHMainViewController : StackTabBarController
{
	
//	UIButton *settingButton;
//	UIButton *searchButton;
//	UIButton *writeEmailButton;
	UIImageView *settingImageView;
	UIImageView *searchImageView;
	UIImageView *writeEmailImageView;
	BOOL landScape;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (nonatomic,strong) NSArray *arrayButtonImages;
@property (nonatomic,strong) NSArray *arrayButtonHighlightImages;
-(void)showTabBarController:(int)type;
@end
