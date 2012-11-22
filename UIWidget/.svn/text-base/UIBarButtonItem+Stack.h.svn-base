//
//  UIBarButtonItem+Stack.h
//

#import <Foundation/Foundation.h>

typedef enum
{
    // 左侧有箭头
	KNAV_BARBUTTONITEM_TYPE_LEFT_ARROW = 1,
    // 右侧有箭头
	KNAV_BARBUTTONITEM_TYPE_RIGHT_ARROW,
    // 无箭头
	KNAV_BARBUTTONITEM_TYPE_ROUNDRECT //无箭头

} NavBarType;

@interface UIBarButtonItem (Stack)

+(id)createBarButtonItemWithTitle:(NSString *)title  type:(NavBarType)barType target:(id)target action:(SEL)selector;

+(id)createBarButtonItemWithImage:(UIImage *)img  type:(NavBarType)barType target:(id)target action:(SEL)selector;

@end
