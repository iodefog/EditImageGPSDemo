//
//  HLImageInfoUtils.h
//  EditImageGPSDemo
//
//  Created by LHL on 17/2/17.
//  Copyright © 2017年 lihongli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <CoreLocation/CoreLocation.h>

@interface HLImageInfoUtils : NSObject

@property (nonatomic , assign) CGImageSourceRef sourceRef;
// 图片信息
@property (nonatomic , strong) NSDictionary     *imageProperty;
//  获取图片
@property (nonatomic, readonly) UIImage         *image;
//  图片的像素高度
@property (nonatomic, assign) NSInteger         pixelHeight;
//  图片的像素宽度
@property (nonatomic, assign) NSInteger         pixelWidth;
//  获取图片创建时间
@property (nonatomic, strong) NSString          *dataTime;
//  图片经纬度
@property (nonatomic, assign) CLLocationCoordinate2D  location2D;

#pragma mark ---

- (id)initWithImage:(UIImage*)image;

- (id)initWithImageURL:(NSURL*)imageUrl;


/**
 *  图片 GPS 信息
 *
 *  @return 字典类型
 */
- (NSDictionary *)gpsDictonary;

/**
 *  图片 TIFF 信息
 *
 *  @return 字典类型
 */
- (NSDictionary *)tiffDictonary;

/**
 *  图片 Exif 信息
 *
 *  @return 字典类型
 */
- (NSDictionary *)exifDictonary;

/**
 *  保存图片
 */
- (void)save;

@end
