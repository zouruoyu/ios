//
//  BusinessTableCell.m
//  Yelp
//
//  Created by Roy Zou on 10/28/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BusinessTableCell.h"
#import "UIImageView+AFNetworking.h"

@implementation BusinessTableCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setBusiness:(YelpBusiness *)business {
    _business = business;
    
    [self.businessImage setImageWithURL:business.imageUrl];
    self.businessNameLabel.text = business.name;
    self.distanceLabel.text = business.distance;
    self.addressLabel.text = business.address;
    self.categoryLabel.text = business.categories;
    [self.ratingImage setImageWithURL:business.ratingImageUrl];
    self.reviewCountLabel.text = [business.reviewCount stringValue];
}
@end
