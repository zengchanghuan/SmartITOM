//
//  DHFirstViewController.h
//  SmartITOM
//

#import <UIKit/UIKit.h>
#import "DHLoginView.h"
#import "DHSetView.h"
//#import "DHDownList.h"

#define UIVIEW_UP_FRAME_LANDSCAPE_X   264
#define UIVIEW_UP_FRAME_LANDSCAPE_Y  120
#define UIVIEW_DOWN_FRAME_LANDSCAPE_X  264
#define UIVIEW_DOWN_FRAME_LANDSCAPE_Y  277

#define UIVIEW_UP_FRAME_PORTRAIT_X  134
#define UIVIEW_UP_FRAME_PORTRAIT_Y  348
#define UIVIEW_DOWN_FRAME_PORTRAIT_X 134
#define UIVIEW_DOWN_FRAME_PORTRAIT_Y 348

@class SmartITOMSqlite;

@interface DHFirstViewController : UIViewController<DHSetViewDelegate,DHLoginViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *logoView;

@property (strong, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) DHLoginView *loginView;
@property (nonatomic,strong) DHSetView *setView;
@property (nonatomic, assign) BOOL isLandscape;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) SmartITOMSqlite *smartITOMSql;

@end
