# BAButton
[![BAHome Team Name](https://img.shields.io/badge/Team-BAHome-brightgreen.svg?style=flat)](https://github.com/BAHome "BAHome Team")
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/cocoapods/v/BAButton.svg?style=flat) ![](https://img.shields.io/cocoapods/dt/BAButton.svg
)  [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

## 1、功能及简介
* 1、UIButton 图片、文字自定义布局 <br>
* 2、UIButton 自定义切圆角，可以设置任意一个角的角半径
* 3、用 UIButton 的分类处理，处理更简单，一行代码轻松搞定所有 UIButton 自定义

## 2、图片示例
![BAButton1](https://github.com/BAHome/BAButton/blob/master/Images/BAButton1.png)
![BAButton2](https://github.com/BAHome/BAButton/blob/master/Images/BAButton2.png)

## 3、安装、导入示例和源码地址
* 1、pod 导入【最新版本：version 2.3.2】： <br>
 `pod 'BAButton'` <br>
如果发现 `pod search BAButton` 搜索出来的不是最新版本，需要在终端执行 cd 转换文件路径命令退回到 desktop，然后执行 `pod setup` 命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了。<br>
具体步骤：
  - pod setup : 初始化
  - pod repo update : 更新仓库
  - pod search BAButton
* 2、文件夹拖入：下载demo，把 BAButton 文件夹拖入项目即可，<br>
* 3、导入头文件：<br>
`  #import "BAButton.h" `<br>
* 4、项目源码地址：<br>
 OC 版 ：[https://github.com/BAHome/BAButton](https://github.com/BAHome/BAButton)<br>

## 4、BAButton 的类结构及 demo 示例
![BAButton3](https://github.com/BAHome/BAButton/blob/master/Images/BAButton3.png)

### BAButton.h
```
#ifndef BAButton_h
#define BAButton_h

#import "UIButton+BAKit.h"

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************
 
 欢迎使用 BAHome 系列开源代码 ！
 如有更多需求，请前往：https://github.com/BAHome
 
 最新更新时间：2017-05-26 【倒叙】
 最新Version：【Version：2.3.2】
 更新内容：
 2.3.2.1、优化代码结构，修复 frame 改变后 padding 无法更改的问题！
 
 最新更新时间：2017-05-24 【倒叙】
 最新Version：【Version：2.3.1】
 更新内容：
 2.3.1.1、新增：padding_inset，文字或图片距离 button 左右边界的最小距离，默认为：5
 
 最新更新时间：2017-05-20 【倒叙】
 最新Version：【Version：2.3.0】
 更新内容：
 2.3.0.1、用分类全新重构 BAButton，代码配置更灵活
 2.3.0.2、可以自由设置 button 的文字和图片的布局、间距、每个角的切圆角
 2.3.0.3、全面适配 纯代码、xib、storyboard
 2.3.0.4、版本改动较大，希望大家谅解，如果用老版本的 BAButton，可以参考demo 更换新版本，后期改动不大

*/


#endif /* BAButton_h */
```

### UIButton+BAKit.h
```
#import "UIView+BARectCorner.h"

NS_ASSUME_NONNULL_BEGIN
/**
 button 的样式，以图片为基准

 - BAButtonLayoutTypeNormal: button 默认样式：内容居中-图左文右
 - BAButtonLayoutTypeCenterImageRight: 内容居中-图右文左
 - BAButtonLayoutTypeCenterImageTop: 内容居中-图上文下
 - BAButtonLayoutTypeCenterImageBottom: 内容居中-图下文上
 - BAButtonLayoutTypeLeftImageLeft: 内容居左-图左文右
 - BAButtonLayoutTypeLeftImageRight: 内容居左-图右文左
 - BAButtonLayoutTypeRightImageLeft: 内容居右-图左文右
 - BAButtonLayoutTypeRightImageRight: 内容居右-图右文左
 */
typedef NS_ENUM(NSInteger, BAButtonLayoutType) {
    BAButtonLayoutTypeNormal = 0,
    BAButtonLayoutTypeCenterImageRight,
    BAButtonLayoutTypeCenterImageTop,
    BAButtonLayoutTypeCenterImageBottom,
    BAButtonLayoutTypeLeftImageLeft,
    BAButtonLayoutTypeLeftImageRight,
    BAButtonLayoutTypeRightImageLeft,
    BAButtonLayoutTypeRightImageRight,
};

@interface UIButton (BAKit)

/**
 button 的布局样式，默认为：BAButtonLayoutTypeNormal，注意：此设置只能在 [self.view addSubview:button] 之后添加样式
 */
@property(nonatomic, assign) BAButtonLayoutType buttonLayoutType;

/*!
 *  文字与图片之间的间距，默认为：0
 */
@property (nonatomic, assign) CGFloat padding;

/*!
 *  文字或图片距离 button 左右边界的最小距离，默认为：5
 */
@property (nonatomic, assign) CGFloat padding_inset;


/**
 快速设置 button 的布局样式 和 间距

 @param type button 的布局样式
 @param padding 文字与图片之间的间距
 */
- (void)ba_button_setBAButtonLayoutType:(BAButtonLayoutType)type padding:(CGFloat)padding;

/**
 快速切圆角

 @param type 圆角样式
 @param viewCornerRadius 圆角角度
 */
- (void)ba_button_setBAViewRectCornerType:(BAViewRectCornerType)type viewCornerRadius:(CGFloat)viewCornerRadius;

/**
 *  给定框架创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame;

/**
 *  给定框架和字符串(字符串字体颜色默认是白色)创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title;

/**
 *  给定框架、字符串和背景图片创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage;

/**
 *  给定框架、字符串、背景图片和高亮背景图片创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage
highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;

/**
 *  给定框架、字符串、颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color;

/**
 *  给定框架、字符串、背景颜色和高亮背景颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

/**
 *  给定框架、颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color;

/**
 *  给定框架、背景颜色和高亮背景颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

/**
 *  给定框架和图片创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image;

/**
 *  给定框架、背景图片和高亮背景图片创建一个UIButton对象 */
+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage;

/**
 *  设置字符字体和大小
 */
- (void)setTitleFont:(NSString *)fontName
                size:(CGFloat)size;

/**
 *  设置字符颜色和高亮颜色
 */
- (void)setTitleColor:(UIColor *)color
     highlightedColor:(UIColor *)highlightedColor;

#pragma mark - 快速创建 button
/**
 创建 button
 
 @param frame frame
 @param title title
 @param selTitle selTitle
 @param titleColor titleColor，默认：黑色
 @param titleFont titleFont默认：15
 @param image image description
 @param selImage selImage
 @param padding padding 文字图片间距
 @param buttonLayoutType buttonLayoutType 文字图片布局样式
 @param viewRectCornerType viewRectCornerType 圆角样式
 @param viewCornerRadius viewCornerRadius 圆角角度
 @param target target
 @param sel sel
 @return button
 */
- (instancetype __nonnull)creatButtonWithFrame:(CGRect)frame
                                         title:(NSString * __nullable)title
                                      selTitle:(NSString * __nullable)selTitle
                                    titleColor:(UIColor * __nullable)titleColor
                                     titleFont:(UIFont * __nullable)titleFont
                                         image:(UIImage * __nullable)image
                                      selImage:(UIImage * __nullable)selImage
                                       padding:(CGFloat)padding
                           buttonPositionStyle:(BAButtonLayoutType)buttonLayoutType
                            viewRectCornerType:(BAViewRectCornerType)viewRectCornerType
                              viewCornerRadius:(CGFloat)viewCornerRadius
                                        target:(id __nullable)target
                                      selector:(SEL __nullable)sel;
```

### UIView+BARectCorner.h
```
/*! 随机色 */
CG_INLINE UIColor *
BAKit_ColorRandom(){
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

/*!
 *  设置 viewRectCornerType 样式，
 *  注意：BAViewRectCornerType 必须要先设置 viewCornerRadius，才能有效，否则设置无效，
 */
typedef NS_ENUM(NSInteger, BAViewRectCornerType) {
    /*!
     *  设置下左角 圆角半径
     */
    BAViewRectCornerTypeBottomLeft = 0,
    /*!
     *  设置下右角 圆角半径
     */
    BAViewRectCornerTypeBottomRight,
    /*!
     *  设置上左角 圆角半径
     */
    BAViewRectCornerTypeTopLeft,
    /*!
     *  设置下右角 圆角半径
     */
    BAViewRectCornerTypeTopRight,
    /*!
     *  设置下左、下右角 圆角半径
     */
    BAViewRectCornerTypeBottomLeftAndBottomRight,
    /*!
     *  设置上左、上右角 圆角半径
     */
    BAViewRectCornerTypeTopLeftAndTopRight,
    /*!
     *  设置下左、上左角 圆角半径
     */
    BAViewRectCornerTypeBottomLeftAndTopLeft,
    /*!
     *  设置下右、上右角 圆角半径
     */
    BAViewRectCornerTypeBottomRightAndTopRight,
    /*!
     *  设置上左、上右、下右角 圆角半径
     */
    BAViewRectCornerTypeBottomRightAndTopRightAndTopLeft,
    /*!
     *  设置下右、上右、下左角 圆角半径
     */
    BAViewRectCornerTypeBottomRightAndTopRightAndBottomLeft,
    /*!
     *  设置全部四个角 圆角半径
     */
    BAViewRectCornerTypeAllCorners
};

@interface UIView (BARectCorner)

/*!
 *  设置 viewRectCornerType 样式，
 *  注意：BAViewRectCornerType 必须要先设置 viewCornerRadius，才能有效，否则设置无效，
 */
@property (nonatomic, assign) BAViewRectCornerType viewRectCornerType;

/*!
 *  设置 button 圆角，如果要全部设置四个角的圆角，可以直接用这个方法，必须要在设置 frame 之后
 */
@property (nonatomic, assign) CGFloat viewCornerRadius;

/**
 快速切圆角
 
 @param type 圆角样式
 @param viewCornerRadius 圆角角度
 */
- (void)ba_view_setBAViewRectCornerType:(BAViewRectCornerType)type viewCornerRadius:(CGFloat)viewCornerRadius;
```
### demo 示例
```
// 示例1：
    [self.normalButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeNormal padding:padding];
    [self.normalButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeft viewCornerRadius:viewCornerRadius];
    
// 示例2：
    CGRect frame = CGRectMake(0, 0, 80, 40);
    UIButton *navi_rightButton = [[UIButton alloc] creatButtonWithFrame:frame title:@"xib" selTitle:nil titleColor:nil titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAButtonLayoutTypeCenterImageRight viewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleRightNaviButtonAction)];
    navi_rightButton.backgroundColor = BAKit_ColorRandom();
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_rightButton];

其他示例可下载demo查看源码！
```

## 5、更新记录：【倒叙】
 欢迎使用 [【BAHome】](https://github.com/BAHome) 系列开源代码 ！
 如有更多需求，请前往：[【https://github.com/BAHome】](https://github.com/BAHome) 
 
 最新更新时间：2017-05-26 【倒叙】
 最新Version：【Version：2.3.2】
 更新内容：
 2.3.2.1、优化代码结构，修复 frame 改变后 padding 无法更改的问题！
 
 最新更新时间：2017-05-24 【倒叙】
 最新Version：【Version：2.3.1】
 更新内容：
 2.3.1.1、新增：padding_inset，文字或图片距离 button 左右边界的最小距离，默认为：5
 
 最新更新时间：2017-05-20 【倒叙】
 最新Version：【Version：2.3.0】<br>
 更新内容：<br>
 2.3.0.1、用分类全新重构 BAButton，代码配置更灵活<br>
 2.3.0.2、可以自由设置 button 的文字和图片的布局、间距、每个角的切圆角<br>
 2.3.0.3、全面适配 纯代码、xib、storyboard<br>
 2.3.0.4、版本改动较大，希望大家谅解，如果用老版本的 BAButton，可以参考demo 更换新版本，后期改动不大<br>

* 2017-04-24 <br>
最新Version：【Version：2.2.1】<br>
更新内容：<br>
2.2.1.1、新增快速创建button 的demo，和 自定义 naviButton demo

* 2017-03-15 <br>
 最新Version：【Version：2.2.1】<br>
 更新内容：<br>
 2.2.1.1、button 的 角半径 buttonCornerRadii，默认 CGSizeMake(0, 0)

* 2017-03-02 <br>
 最新Version：【Version：2.2.0】<br>
 更新内容：<br>
 2.2.0.1、修复 buttonCornerRadii 只能在添加frame 后设置才能有效的问题，现在可以随意设置<br>
 2.2.0.2、新增设置文字或和图片间距，举个🌰：self.padding = 10;

* 2017-02-28 【倒叙】<br>
 最新Version：【Version：2.1.0】<br>
 更新内容：<br>
 2.1.1、继承自 UIButton 可以像 UIButton 一样随便添加系统属性<br>
 2.1.2、可以单独设置文字和图片的位置<br>
 2.1.3、还可以设置文字或者图片间距<br>
 2.1.4、可以设置按钮的任意一个角的圆角度数<br>
 2.1.4、全面适配纯代码、xib、storyboard
* 2016.03.04 <br>
pod 最新上架，修复部分已知bug，代码更精简！

## 6、bug 反馈 和 联系方式
> 1、开发中遇到 bug，希望小伙伴儿们能够及时反馈与我们 BAHome 团队，我们必定会认真对待每一个问题！ <br>

> 2、联系方式 <br> 
QQ群：479663605  【注意：此群为 2 元 付费群，介意的小伙伴儿勿扰！】<br> 
博爱QQ：137361770 <br> 
博爱微博：[![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123) <br> 

## 7、开发环境 和 支持版本
> 开发使用 Xcode Version 8.3.2 (8E2002) ，理论上支持所有 iOS 版本，如有版本适配问题，请及时反馈！多谢合作！

## 8、感谢
> 感谢 BAHome 团队成员倾力合作，后期会推出一系列 常用 UI 控件的封装，大家有需求得也可以在 issue 提出，如果合理，我们会尽快推出新版本！<br>

> BAHome 的发展离不开小伙伴儿的信任与推广，再次感谢各位小伙伴儿的支持！

