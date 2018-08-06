#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface QackConfig : NSObject

+ (NSString *)url:(NSString *)relativePath;
+ (NSString *)url:(NSString *)relativePath searchQuery:(NSString *)searchQuery;
+ (NSString *) urlForNewsList:(NSString *)searchQuery;

@end
