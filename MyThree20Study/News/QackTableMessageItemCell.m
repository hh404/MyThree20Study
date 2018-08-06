//
//  QackTableMessageItemCell.m
//  iYnby
//
//  Created by ji yongshan on 13-5-9.
//
//

#import "QackTableMessageItemCell.h"
#import "UIViewAdditions.h"
#import "UIFontAdditions.h"

static const NSInteger  kQackMessageTextLineCount       = 3;
static const NSInteger  kQackMessageRowHeight       = 90;
static const CGFloat    kQackMessageImageWidth   = 75.0f;
static const CGFloat    kQackMessageImageHeight  = 75.0f;

@implementation QackTableMessageItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	self = [super initWithStyle:style reuseIdentifier:identifier];
    if (self) {
        self.detailTextLabel.numberOfLines = kQackMessageTextLineCount;
    }
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
    // XXXjoe Compute height based on font sizes
    return kQackMessageRowHeight;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat left = 0.0f;
    if (_imageView2) {
        _imageView2.frame = CGRectMake(kTableCellSmallMargin, kTableCellSmallMargin + 1, kQackMessageImageWidth, kQackMessageImageHeight);
        
        left += kTableCellSmallMargin + kQackMessageImageWidth + kTableCellSmallMargin;
        
    }else {
        left = kTableCellMargin;
    }
        
    CGFloat width = self.contentView.width - left;
    CGFloat top = kTableCellSmallMargin;
    
    if (_titleLabel.text.length) {
        _titleLabel.frame = CGRectMake(left, top, width, _titleLabel.font.ttLineHeight);
        top += _titleLabel.height;
        
    } else {
        _titleLabel.frame = CGRectZero;
    }
    
    if (self.captionLabel.text.length) {
        self.captionLabel.frame = CGRectMake(left, top, width, self.captionLabel.font.ttLineHeight);
        top += self.captionLabel.height;
        
    } else {
        self.captionLabel.frame = CGRectZero;
    }
    
    if (self.detailTextLabel.text.length) {
        CGFloat textHeight = self.detailTextLabel.font.ttLineHeight * kQackMessageTextLineCount;
        self.detailTextLabel.frame = CGRectMake(left, top, width, textHeight);
        
    } else {
        self.detailTextLabel.frame = CGRectZero;
    }
    
    if (_timestampLabel.text.length) {
        _timestampLabel.alpha = !self.showingDeleteConfirmation;
        [_timestampLabel sizeToFit];
        _timestampLabel.left = self.contentView.width - (_timestampLabel.width + kTableCellSmallMargin);
        _timestampLabel.top = _titleLabel.top;
        _titleLabel.width -= _timestampLabel.width + kTableCellSmallMargin*2;
        
    } else {
        _timestampLabel.frame = CGRectZero;
    }
}

@end
