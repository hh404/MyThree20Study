//
//  QackNewsBean.h
//  iYnby
//
//  Created by ji yongshan on 13-5-8.
//
//

#import <Foundation/Foundation.h>

@interface QackNewsItem : NSObject

@property (retain, nonatomic) NSString *ID;
@property (retain, nonatomic) NSString *commentCount;
@property (retain, nonatomic) NSString *image;
@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSString *summary;
@property (retain, nonatomic) NSDate *updated;
@property (retain, nonatomic) NSString *content;


@end
